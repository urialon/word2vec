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
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 1 -size 150 -window 1 -negative 5 -hs 0 -sample 0 -threads 64 -binary 1 -min-count 200 -paths-min-count 0 -save-vocab $VOCAB_FILE -iter 5

  
echo -----------------------------------------------------------------------------------------------------
echo -- distance...

#$BIN_DIR/distance $VECTOR_DATA
