#!/bin/bash
if [ $# -lt 2 ]
    then
        echo "Usage: uridemo.sh <length> <width>"
        exit 1
fi
length=$1
width=$2

DATA_DIR=data
BIN_DIR=bin
SRC_DIR=src

MODEL=jsnice_training_clean${length}x${width}
TEXT_DATA=../UnuglifyJS/glove_models/$MODEL.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi

pushd ${SRC_DIR} && make; popd

MODEL=jsnice_training_clean${length}x${width}xcbow0hs0
VECTOR_DATA=models/$MODEL/vectors.bin
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cp jsnice_training_clean4x1/vocab.txt $MODEL
fi
cd ..
time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 0 -size 150 -window 1 -negative 5 -hs 0 -sample 0 -threads 64 -binary 1 -min-count 200 -paths-min-count 0 -read-vocab $VOCAB_FILE
MODEL=jsnice_training_clean${length}x${width}xcbow1hs0
VECTOR_DATA=models/$MODEL/vectors.bin
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cp jsnice_training_clean4x1/vocab.txt $MODEL
fi
cd ..
time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 1 -size 150 -window 1 -negative 5 -hs 0 -sample 0 -threads 64 -binary 1 -min-count 200 -paths-min-count 0 -read-vocab $VOCAB_FILE
MODEL=jsnice_training_clean${length}x${width}xcbow1hs1
VECTOR_DATA=models/$MODEL/vectors.bin
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cp jsnice_training_clean4x1/vocab.txt $MODEL
fi
cd ..
time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 1 -size 150 -window 1 -negative 5 -hs 1 -sample 0 -threads 64 -binary 1 -min-count 200 -paths-min-count 0 -read-vocab $VOCAB_FILE
MODEL=jsnice_training_clean${length}x${width}xcbow0hs1_sample
VECTOR_DATA=models/$MODEL/vectors.bin
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cp jsnice_training_clean4x1/vocab.txt $MODEL
fi
cd ..
time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 0 -size 150 -window 1 -negative 5 -hs 1 -sample 1e-4 -threads 64 -binary 1 -min-count 200 -paths-min-count 0 -read-vocab $VOCAB_FILE
  
#echo -----------------------------------------------------------------------------------------------------
#echo -- distance...

#$BIN_DIR/distance $VECTOR_DATA
