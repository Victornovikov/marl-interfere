# Structure 
*Runner class* performs training, evalution and data collection for the MPEs.

*MAPPO policy* calass wraps actor and critic networks to computa actions and value function predictions given centralized input (MAPPO) or local observations (iPPO).

*actor-critic* Actor network class for MAPPO. Outputs actions given observations. Critic network class for MAPPO. Outputs value function predictions given centralized input (MAPPO) or local observations (IPPO).