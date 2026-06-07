#!/usr/bin/env python3

import sys
from pathlib import Path
import tomllib


def merge(base, override):
    result = dict(base)
    for key, value in override.items():
        if isinstance(value, dict) and isinstance(result.get(key), dict):
            result[key] = merge(result[key], value)
        else:
            result[key] = value
    return result


def format_key(key):
    if key.replace("_", "").replace("-", "").isalnum() and not key[0].isdigit():
        return key
    return format_value(key)


def format_value(value):
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, int):
        return str(value)
    if isinstance(value, str):
        return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'
    if isinstance(value, list):
        return "[" + ", ".join(format_value(item) for item in value) + "]"
    raise TypeError(f"unsupported TOML value: {value!r}")


def emit_table(lines, table, prefix=()):
    scalars = []
    subtables = []
    for key, value in table.items():
        if isinstance(value, dict):
            subtables.append((key, value))
        else:
            scalars.append((key, value))

    if prefix:
        lines.append("")
        lines.append("[" + ".".join(format_key(part) for part in prefix) + "]")

    for key, value in scalars:
        lines.append(f"{format_key(key)} = {format_value(value)}")

    for key, value in subtables:
        emit_table(lines, value, prefix + (key,))


def load_toml(path):
    with path.open("rb") as f:
        return tomllib.load(f)


def main():
    if len(sys.argv) != 4:
        print(
            "usage: render-config.py BASE_CONFIG LOCAL_CONFIG OUTPUT_CONFIG",
            file=sys.stderr,
        )
        return 2

    base_path, local_path, output_path = map(Path, sys.argv[1:])
    config = load_toml(base_path)

    if local_path.exists():
        config = merge(config, load_toml(local_path))

    lines = []
    emit_table(lines, config)
    output_path.write_text("\n".join(lines).lstrip() + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
