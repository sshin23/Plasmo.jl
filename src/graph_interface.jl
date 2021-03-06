#Create a hypergraph object from a ModelGraph.  Return the hypergraph and a mapping of hypergraph nodes and edges to modelgraph modelnodes and linkedges.
#A hypergraph has topology functions and partitioning interfaces.

#Create a hypergraph representation of a modelgraph
function gethypergraph(graph::OptiGraph)
    hypergraph = HyperGraph()
    hyper_map = Dict()  #two-way mapping from hypergraph nodes to modelnodes and link_edges

    for node in all_nodes(graph)
        hypernode = add_node!(hypergraph)
        hyper_map[hypernode] = node
        hyper_map[node] = hypernode
    end

    for edge in all_edges(graph)
        nodes = edge.nodes
        hypernodes = [hyper_map[modelnode] for modelnode in nodes]
        if length(hypernodes) >= 2
            hyperedge = add_hyperedge!(hypergraph,hypernodes...)
            hyper_map[hyperedge] = edge
            hyper_map[edge] = hyperedge
        end
    end

    return hypergraph,hyper_map
end

#Create a lightgraph Graph using a modelgraph
function getcliquegraph(graph::OptiGraph)
end

#Create a bipartite graph using a modelgraph
function getbipartitegraph(graph::OptiGraph)
end
