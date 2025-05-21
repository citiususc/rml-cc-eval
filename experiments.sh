#!/bin/bash

MAPPINGS_DIR="test-cases"
DATA_DIR="data"
OUTPUT_DIR="outputs"
RESULTS_FILE="execution_times.csv"
JAR="burp.jar"
MAPPING_FILE="mapping.ttl"
REPEATS=3

mkdir -p "$OUTPUT_DIR"
echo "Mapping,Dataset,Run1(ms),Run2(ms),Run3(ms),Average(ms)" > "$RESULTS_FILE"

while IFS=, read -r mapping dataset; do
  mapping_path="${MAPPINGS_DIR}/${mapping}/${MAPPING_FILE}"
  data_path="${DATA_DIR}/${dataset}"

  if [ ! -f "$mapping_path" ]; then
    echo "❌ Mapping not found: $mapping_path"
    continue
  fi

  if [ ! -d "$data_path" ]; then
    echo "❌ Data folder not found: $data_path"
    continue
  fi

  # Process each .json and .csv file in the dataset folder
  for actual_file in "$data_path"/*.json "$data_path"/*.csv; do
    [ -e "$actual_file" ] || continue

    extension="${actual_file##*.}"

    cp "$actual_file" "./data.${extension}"
    cp "$mapping_path" "./mapping.ttl"
    echo "🚀 Running $mapping with dataset $dataset using $(basename "$actual_file")"

    times=()
    for i in $(seq 1 $REPEATS); do
      output_file="${OUTPUT_DIR}/${mapping}_$(basename "$actual_file")_run${i}.ttl"

      start=$(gdate +%s%3N)
      java -jar "$JAR" -b http://example.org/ -m "mapping.ttl" -o "$output_file"
      end=$(gdate +%s%3N)

      duration=$((end - start))
      times+=($duration)
      echo "   ⏱️ Run $i: ${duration} ms"
    done

    avg=$(( (times[0] + times[1] + times[2]) / 3 ))
    echo "$mapping,$dataset,$(basename "$actual_file"),${times[0]},${times[1]},${times[2]},$avg" >> "$RESULTS_FILE"
    echo "✅ Average for $(basename "$actual_file"): ${avg} ms"
    rm -f "$data_path/mapping.ttl"
    rm -f "$temp_data_file"
  done
done < experiments1.csv