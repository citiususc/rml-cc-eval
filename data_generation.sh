#!/bin/bash

#individual
python3 src/scale_data_one.py test-cases/RMLTC-CC-0001-Alt/data.json data/simple/10K.json --count 10000 --list_length 100
python3 src/scale_data_one.py test-cases/RMLTC-CC-0001-Alt/data.json data/simple/100K.json --count 100000 --list_length 100
python3 src/scale_data_one.py test-cases/RMLTC-CC-0001-Alt/data.json data/simple/1M.json --count 1000000 --list_length 100
python3 src/scale_data_one.py test-cases/RMLTC-CC-0001-Alt/data.json data/simple/10M.json --count 10000000 --list_length 100


## multivalue

python3 src/scale_data_multi.py test-cases/RMLTC-CC-0005-App1/data.json data/multivalues/10K.json --add_values 10000 --unique
python3 src/scale_data_multi.py test-cases/RMLTC-CC-0005-App1/data.json data/multivalues/100K.json --add_values 100000 --unique
python3 src/scale_data_multi.py test-cases/RMLTC-CC-0005-App1/data.json data/multivalues/1M.json --add_values 1000000 --unique
python3 src/scale_data_multi.py test-cases/RMLTC-CC-0005-App1/data.json data/multivalues/10M.json --add_values 10000000 --unique

## Duplication
python3 src/scale_duplication.py test-cases/RMLTC-CC-0009-DUP-Bag/data.json data/duplicates/1M_25.json --count 1 --list_length 1000000 --duplication_rate 0.25
python3 src/scale_duplication.py test-cases/RMLTC-CC-0009-DUP-Bag/data.json data/duplicates/1M_50.json --count 1 --list_length 1000000 --duplication_rate 0.5
python3 src/scale_duplication.py test-cases/RMLTC-CC-0009-DUP-Bag/data.json data/duplicates/1M_75.json --count 1 --list_length 1000000 --duplication_rate 0.75
python3 src/scale_duplication.py test-cases/RMLTC-CC-0009-DUP-Bag/data.json data/duplicates/1M_100.json --count 1 --list_length 1000000 --duplication_rate 1

## Duplication join
python3 src/scale_join.py test-cases/RMLTC-CC-0008-ROMa/student.csv data/join/1M_25.json --count 1000000 --duplication_rate 0.25
python3 src/scale_join.py test-cases/RMLTC-CC-0008-ROMa/student.csv data/join/1M_50.json --count 1000000 --duplication_rate 0.5
python3 src/scale_join.py test-cases/RMLTC-CC-0008-ROMa/student.csv data/join/1M_75.json --count 1000000  --duplication_rate 0.75
python3 src/scale_join.py test-cases/RMLTC-CC-0008-ROMa/student.csv data/join/1M_100.json --count 1000000 --duplication_rate 1
