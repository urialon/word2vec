from gensim.models import word2vec
import sys

bin = sys.argv[1]
text = sys.argv[2]
model = word2vec.Word2Vec.load_word2vec_format(bin, binary=True)
model.save_word2vec_format(text, binary=False)