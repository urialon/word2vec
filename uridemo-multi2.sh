#!/bin/bash
if [ $# -lt 2 ]
    then
        #echo "Usage: uridemo.sh <length> <width>"
        #exit 1
        length=4
        width=1
else
    length=$1
    width=$2
fi

DATA_DIR=data
BIN_DIR=bin
SRC_DIR=src

CBOW=1
NEG=5
HS=0
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=5

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=0
NEG=5
HS=0
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=5

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=1
NEG=5
HS=1
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=5

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=0
NEG=5
HS=1
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=5

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

##########################################################################################################
# now 10 iterations

CBOW=1
NEG=5
HS=0
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=10

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=0
NEG=5
HS=0
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=10

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=1
NEG=5
HS=1
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=10

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

CBOW=0
NEG=5
HS=1
SAMPLE=0
MIN_COUNT=200
PATHS_MIN_COUNT=0
ITER=10

DESC=js${length}x${width}_cbow${CBOW}_hs${HS}_neg${NEG}_sample${SAMPLE}_mincount${MIN_COUNT}_pathsmincount${PATHS_MIN_COUNT}_iter${ITER}
MODEL=js_cbow${CBOW}_hs${HS}_iter${ITER}
TEXT_DATA=../UnuglifyJS/glove_models/jsnice_training_clean${length}x${width}.txt
VOCAB_FILE=models/$MODEL/vocab.txt
VECTOR_DATA=models/$MODEL/vectors.bin

if [ ! -d "models" ]; then
  mkdir models
fi
cd models
if [ ! -d "$MODEL" ]; then
  mkdir $MODEL
  cd $MODEL
  echo $DESC > description.txt
  cd ..
fi
cd ..

pushd ${SRC_DIR} && make; popd

time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow $CBOW -size 150 -window 1 -negative $NEG -hs $HS -sample $SAMPLE -threads 64 -binary 1 -min-count $MIN_COUNT -save-vocab $VOCAB_FILE

