# Structure 
*Runner class* performs training, evalution and data collection for the MPEs.

*MAPPO policy* calass wraps actor and critic networks to computa actions and value function predictions given centralized input (MAPPO) or local observations (iPPO).

*actor-critic* Actor network class for MAPPO. Outputs actions given observations. Critic network class for MAPPO. Outputs value function predictions given centralized input (MAPPO) or local observations (IPPO).


# Replay buffer initiation (warmup)

The issue arises when copying observations to shared buffer.( possibly it shouldnt be shared)

Shared (for push it shouldn't be shared?)
1. trainer calls runner and passes the config.
2. base runner initiates replay buffer by calling SharedReplayBuffer from utils