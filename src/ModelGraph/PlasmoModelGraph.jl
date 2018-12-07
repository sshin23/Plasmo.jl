module PlasmoModelGraph

using ..PlasmoGraphBase
using Requires

import ..PlasmoGraphBase:getedge

import JuMP
import JuMP:AbstractModel, AbstractConstraint, AbstractJuMPScalar, Model, ConstraintRef
import Base.==


#Model Graph Constructs
export AbstractModelGraph, ModelGraph, ModelTree, ModelNode, LinkingEdge, LinkConstraint,
JuMPGraphModel, JuMPGraph,

#Solver Constructs
BendersSolver,LagrangeSolver,PipsSolver,

load_pips,

#re-export base functions
add_node!,getnodes,collectnodes,

#Model functions
setmodel,setsolver,setmodel!,resetmodel,is_nodevar,getmodel,getsolver,hasmodel,
getnumnodes, getobjectivevalue, getinternalgraphmodel,getroot,

#Link Constraints
addlinkconstraint, getlinkreferences, getlinkconstraints, getsimplelinkconstraints, gethyperlinkconstraints, get_all_linkconstraints,


#Graph Transformation functions
aggregate!,create_aggregate_model,create_partitioned_model_graph,create_lifted_model_graph,

#JuMP Interface functions
buildjumpmodel!, create_jump_graph_model,
getgraph,getnodevariables,getnodevariable,getnodevariablemap,getnodeobjective,getnodeconstraints,getnodedata,is_graphmodel,

#solve handles
solve_jump,pipsnlp_solve,dsp_solve,bendersolve,solve,

#Solution management
getsolution,setsolution,setvalue,getvalue,

#macros
@linkconstraint,@getconstraintlist

#Abstract Types
abstract type AbstractModelGraph <: AbstractPlasmoGraph end
abstract type AbstractModelNode <: AbstractPlasmoNode end
abstract type AbstractLinkingEdge  <: AbstractPlasmoEdge end
abstract type AbstractPlasmoSolver end

include("linkmodel.jl")

include("modelgraph.jl")

include("modelnode.jl")

include("modeledge.jl")

include("modeltree.jl")

include("solve.jl")

include("solution.jl")

include("macros.jl")

include("aggregation.jl")

#Plasmo Solvers
include("plasmo_solvers/plasmo_solvers.jl")


#External Solver Interfaces
include("solver_interfaces/wrapped_solvers.jl")

include("solver_interfaces/plasmoPipsNlpInterface3.jl")
# load_pips()
#
# load_dsp()

end