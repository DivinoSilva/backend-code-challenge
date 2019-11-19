require 'dijkstra_graph'

class CostCalculator
  class CostError < StandardError; end

  def initialize(coordinateds, origin, destination, weight)
    @coordinateds = coordinateds
    @origin = origin
    @destination = destination
    @weight = weight
  end

  def cost
    graph = DijkstraGraph::Graph.new
    @coordinateds.each{ |c| graph.add_undirected_edge(c.origin, c.destination, c.distance) }
    route_cost = graph.shortest_distances(@origin)[@destination]

    raise CostError.new('route_not_found') if route_cost == Float::INFINITY

    route_cost * @weight * 0.15
  end
end
