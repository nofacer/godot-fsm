```mermaid
---
title: Top-Down Movement
---
stateDiagram-v2
    [*] --> Idle
    
	Idle --> Walk
	Idle --> Run
	
	Walk --> Idle
	Walk --> Run
	Walk --> Dash
	
	Run --> Idle
	Run --> Walk
	Run --> Dash

	Dash --> Walk
	Dash --> Run
```