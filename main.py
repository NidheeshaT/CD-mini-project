import pydot

graphs = pydot.graph_from_dot_file('y.dot')
graph = graphs[0]
graph.write_png("output.png")