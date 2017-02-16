import numpy as np
from sklearn.cluster import KMeans, AgglomerativeClustering

vectors_file = 'models/js_cbow0_hs1_iter5_min100_shuffled/vectors_filtered.txt'
clusters_file = 'models/js_cbow0_hs1_iter5_min100_shuffled/clusters.txt'
num_clusters = 10000

def normalize_vector(vector):
    magnitude = (np.sum(vector ** 2,) ** 0.5)
    return vector/magnitude

def find_representative(vectors):
    best_index = 0;
    best_sum = 0
    for i in range(len(vectors)):
        vec = vectors[i];
        sum = np.sum([np.dot(vec, otherVec.T) for otherVec in vectors])
        if sum > best_sum:
            best_sum = sum
            best_index = i
    return best_index

with open(vectors_file, 'r') as file:
    nameToIndex = {}
    for i,line in enumerate(file):
        lineVals = line.rstrip().split(' ')
        if i == 0:
            vocabSize = int(lineVals[0])
            dim = int(lineVals[1])
            vectors = np.zeros((vocabSize, dim))
        else:
            index = i-1
            vectors[index] = normalize_vector(np.array([float(x) for x in lineVals[1:]]))
            nameToIndex[lineVals[0]] = index

#kmeans_clustering = KMeans( n_clusters = num_clusters )
#clusters = kmeans_clustering.fit_predict( vectors )

model = AgglomerativeClustering(n_clusters=num_clusters, linkage="average", affinity="cosine")
clusters = model.fit_predict(vectors)

with open(clusters_file, 'w') as file:
    for cluster in clusters:
        file.write(str(cluster) + "\n")
#exit(1)

'''clusters = []
with open(clusters_file, 'r') as file:
    for line in file:
        clusters.append(float(line.rstrip()))'''

nameToCluster = {key: clusters[val] for key,val in nameToIndex.iteritems()}

for cluster in range(0,num_clusters):
    #
    # Print the cluster number
    print "\nCluster %d" % cluster
    #
    # Find all of the words for that cluster number, and print them out
    words = []
    cluster_vectors = []
    for name,itemCluster in nameToCluster.iteritems():
        if (itemCluster == cluster):
            words.append(name)
            cluster_vectors.append(vectors[nameToIndex[name]])
    representative_index = find_representative(cluster_vectors)
    print words
    print "Representative: " + words[representative_index]
