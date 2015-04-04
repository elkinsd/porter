Porter
======

## Examples

```
$ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

[name: 'perl perl/portserver.pl', links: [#PID<0.128.0>], id: 41584,
 connected: #PID<0.128.0>, input: 0, output: 0, os_pid: 70178]
[name: 'perl perl/portserver.pl', links: [#PID<0.130.0>], id: 42168,
 connected: #PID<0.130.0>, input: 0, output: 0, os_pid: 70179]
[name: 'perl perl/portserver.pl', links: [#PID<0.132.0>], id: 42176,
 connected: #PID<0.132.0>, input: 0, output: 0, os_pid: 70180]
[name: 'perl perl/portserver.pl', links: [#PID<0.134.0>], id: 42184,
 connected: #PID<0.134.0>, input: 0, output: 0, os_pid: 70181]
[name: 'perl perl/portserver.pl', links: [#PID<0.136.0>], id: 42192,
 connected: #PID<0.136.0>, input: 0, output: 0, os_pid: 70182]
[name: 'perl perl/portserver.pl', links: [#PID<0.138.0>], id: 42200,
 connected: #PID<0.138.0>, input: 0, output: 0, os_pid: 70183]
[name: 'perl perl/portserver.pl', links: [#PID<0.140.0>], id: 42208,
 connected: #PID<0.140.0>, input: 0, output: 0, os_pid: 70184]
[name: 'perl perl/portserver.pl', links: [#PID<0.142.0>], id: 42216,
 connected: #PID<0.142.0>, input: 0, output: 0, os_pid: 70185]
Interactive Elixir (1.1.0-dev) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
```

```
iex(1)> task = Porter.Tasker.create_task("this is the task data")
%Task{pid: #PID<0.145.0>, ref: #Reference<0.0.0.712>}
iex(2)> PortServer got message: {#Port<0.5198>, {:data, "MSG: CALLER: {#PID<0.146.0>, #Reference<0.0.0.720>}\n{:task, #PID<0.145.0>, \"this is the task data\"}\n\n"}}
PortServer got message: {#Port<0.5198>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.145.0>, \"this is the task data\"}", "MSG: CALLER: {#PID<0.146.0>, #Reference<0.0.0.720>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.145.0>, \"this is the task data\"}", "MSG: CALLER: {#PID<0.146.0>, #Reference<0.0.0.720>}", "EOL", "OK"] from #PID<0.127.0>
```

```
iex(2)> value = Porter.Tasker.get_value(task)
["{:task, #PID<0.145.0>, \"this is the task data\"}",
 "MSG: CALLER: {#PID<0.146.0>, #Reference<0.0.0.720>}", "EOL", "OK"]
```

```
values = Porter.Tasker.create_tasks("data", 25) |> Porter.Tasker.get_values
iex(3)> values = Porter.Tasker.create_tasks("data", 25) |> Porter.Tasker.get_values 
PortServer got message: {#Port<0.5271>, {:data, "MSG: CALLER: {#PID<0.174.0>, #Reference<0.0.0.838>}\n{:task, #PID<0.149.0>, {1, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5272>, {:data, "MSG: CALLER: {#PID<0.175.0>, #Reference<0.0.0.842>}\n{:task, #PID<0.150.0>, {2, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5273>, {:data, "MSG: CALLER: {#PID<0.176.0>, #Reference<0.0.0.846>}\n{:task, #PID<0.151.0>, {3, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5276>, {:data, "MSG: CALLER: {#PID<0.179.0>, #Reference<0.0.0.873>}\n{:task, #PID<0.154.0>, {6, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5275>, {:data, "MSG: CALLER: {#PID<0.178.0>, #Reference<0.0.0.862>}\n{:task, #PID<0.153.0>, {5, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5277>, {:data, "MSG: CALLER: {#PID<0.180.0>, #Reference<0.0.0.874>}\n{:task, #PID<0.155.0>, {7, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5274>, {:data, "MSG: CALLER: {#PID<0.177.0>, #Reference<0.0.0.850>}\n{:task, #PID<0.152.0>, {4, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5198>, {:data, "MSG: CALLER: {#PID<0.181.0>, #Reference<0.0.0.876>}\n{:task, #PID<0.156.0>, {8, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5271>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5272>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5273>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5276>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5274>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5275>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5277>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5198>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.150.0>, {2, \"data\"}}", "MSG: CALLER: {#PID<0.175.0>, #Reference<0.0.0.842>}", "EOL", "OK"]
value: ["{:task, #PID<0.149.0>, {1, \"data\"}}", "MSG: CALLER: {#PID<0.174.0>, #Reference<0.0.0.838>}", "EOL", "OK"]
value: ["{:task, #PID<0.151.0>, {3, \"data\"}}", "MSG: CALLER: {#PID<0.176.0>, #Reference<0.0.0.846>}", "EOL", "OK"]
value: ["{:task, #PID<0.152.0>, {4, \"data\"}}", "MSG: CALLER: {#PID<0.177.0>, #Reference<0.0.0.850>}", "EOL", "OK"]
value: ["{:task, #PID<0.153.0>, {5, \"data\"}}", "MSG: CALLER: {#PID<0.178.0>, #Reference<0.0.0.862>}", "EOL", "OK"]
value: ["{:task, #PID<0.154.0>, {6, \"data\"}}", "MSG: CALLER: {#PID<0.179.0>, #Reference<0.0.0.873>}", "EOL", "OK"]
value: ["{:task, #PID<0.155.0>, {7, \"data\"}}", "MSG: CALLER: {#PID<0.180.0>, #Reference<0.0.0.874>}", "EOL", "OK"]
value: ["{:task, #PID<0.156.0>, {8, \"data\"}}", "MSG: CALLER: {#PID<0.181.0>, #Reference<0.0.0.876>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.151.0>, {3, \"data\"}}", "MSG: CALLER: {#PID<0.176.0>, #Reference<0.0.0.846>}", "EOL", "OK"] from #PID<0.133.0>
PortServer got message: {#Port<0.5271>, {:data, "MSG: CALLER: {#PID<0.183.0>, #Reference<0.0.0.923>}\n{:task, #PID<0.158.0>, {10, \"data\"}}\n\n"}}
Work done, ["{:task, #PID<0.150.0>, {2, \"data\"}}", "MSG: CALLER: {#PID<0.175.0>, #Reference<0.0.0.842>}", "EOL", "OK"] from #PID<0.131.0>
Work done, ["{:task, #PID<0.152.0>, {4, \"data\"}}", "MSG: CALLER: {#PID<0.177.0>, #Reference<0.0.0.850>}", "EOL", "OK"] from #PID<0.135.0>
Work done, ["{:task, #PID<0.149.0>, {1, \"data\"}}", "MSG: CALLER: {#PID<0.174.0>, #Reference<0.0.0.838>}", "EOL", "OK"] from #PID<0.129.0>
Work done, ["{:task, #PID<0.154.0>, {6, \"data\"}}", "MSG: CALLER: {#PID<0.179.0>, #Reference<0.0.0.873>}", "EOL", "OK"] from #PID<0.139.0>
Work done, ["{:task, #PID<0.153.0>, {5, \"data\"}}", "MSG: CALLER: {#PID<0.178.0>, #Reference<0.0.0.862>}", "EOL", "OK"] from #PID<0.137.0>
Work done, ["{:task, #PID<0.155.0>, {7, \"data\"}}", "MSG: CALLER: {#PID<0.180.0>, #Reference<0.0.0.874>}", "EOL", "OK"] from #PID<0.141.0>
Work done, ["{:task, #PID<0.156.0>, {8, \"data\"}}", "MSG: CALLER: {#PID<0.181.0>, #Reference<0.0.0.876>}", "EOL", "OK"] from #PID<0.127.0>
PortServer got message: {#Port<0.5273>, {:data, "MSG: CALLER: {#PID<0.184.0>, #Reference<0.0.0.930>}\n{:task, #PID<0.159.0>, {11, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5272>, {:data, "MSG: CALLER: {#PID<0.182.0>, #Reference<0.0.0.917>}\n{:task, #PID<0.157.0>, {9, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5275>, {:data, "MSG: CALLER: {#PID<0.186.0>, #Reference<0.0.0.949>}\n{:task, #PID<0.161.0>, {13, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5276>, {:data, "MSG: CALLER: {#PID<0.187.0>, #Reference<0.0.0.963>}\n{:task, #PID<0.162.0>, {14, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5274>, {:data, "MSG: CALLER: {#PID<0.185.0>, #Reference<0.0.0.943>}\n{:task, #PID<0.160.0>, {12, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5277>, {:data, "MSG: CALLER: {#PID<0.189.0>, #Reference<0.0.0.973>}\n{:task, #PID<0.163.0>, {15, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5198>, {:data, "MSG: CALLER: {#PID<0.188.0>, #Reference<0.0.0.971>}\n{:task, #PID<0.164.0>, {16, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5273>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5271>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5272>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5275>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.159.0>, {11, \"data\"}}", "MSG: CALLER: {#PID<0.184.0>, #Reference<0.0.0.930>}", "EOL", "OK"]
value: ["{:task, #PID<0.158.0>, {10, \"data\"}}", "MSG: CALLER: {#PID<0.183.0>, #Reference<0.0.0.923>}", "EOL", "OK"]
PortServer got message: {#Port<0.5276>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5277>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.157.0>, {9, \"data\"}}", "MSG: CALLER: {#PID<0.182.0>, #Reference<0.0.0.917>}", "EOL", "OK"]
PortServer got message: {#Port<0.5274>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.161.0>, {13, \"data\"}}", "MSG: CALLER: {#PID<0.186.0>, #Reference<0.0.0.949>}", "EOL", "OK"]
value: ["{:task, #PID<0.162.0>, {14, \"data\"}}", "MSG: CALLER: {#PID<0.187.0>, #Reference<0.0.0.963>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.159.0>, {11, \"data\"}}", "MSG: CALLER: {#PID<0.184.0>, #Reference<0.0.0.930>}", "EOL", "OK"] from #PID<0.133.0>
Work done, ["{:task, #PID<0.158.0>, {10, \"data\"}}", "MSG: CALLER: {#PID<0.183.0>, #Reference<0.0.0.923>}", "EOL", "OK"] from #PID<0.129.0>
PortServer got message: {#Port<0.5198>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.160.0>, {12, \"data\"}}", "MSG: CALLER: {#PID<0.185.0>, #Reference<0.0.0.943>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.161.0>, {13, \"data\"}}", "MSG: CALLER: {#PID<0.186.0>, #Reference<0.0.0.949>}", "EOL", "OK"] from #PID<0.137.0>
value: ["{:task, #PID<0.163.0>, {15, \"data\"}}", "MSG: CALLER: {#PID<0.189.0>, #Reference<0.0.0.973>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.157.0>, {9, \"data\"}}", "MSG: CALLER: {#PID<0.182.0>, #Reference<0.0.0.917>}", "EOL", "OK"] from #PID<0.131.0>
Work done, ["{:task, #PID<0.162.0>, {14, \"data\"}}", "MSG: CALLER: {#PID<0.187.0>, #Reference<0.0.0.963>}", "EOL", "OK"] from #PID<0.139.0>
value: ["{:task, #PID<0.164.0>, {16, \"data\"}}", "MSG: CALLER: {#PID<0.188.0>, #Reference<0.0.0.971>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.160.0>, {12, \"data\"}}", "MSG: CALLER: {#PID<0.185.0>, #Reference<0.0.0.943>}", "EOL", "OK"] from #PID<0.135.0>
Work done, ["{:task, #PID<0.163.0>, {15, \"data\"}}", "MSG: CALLER: {#PID<0.189.0>, #Reference<0.0.0.973>}", "EOL", "OK"] from #PID<0.141.0>
Work done, ["{:task, #PID<0.164.0>, {16, \"data\"}}", "MSG: CALLER: {#PID<0.188.0>, #Reference<0.0.0.971>}", "EOL", "OK"] from #PID<0.127.0>
PortServer got message: {#Port<0.5273>, {:data, "MSG: CALLER: {#PID<0.190.0>, #Reference<0.0.0.1008>}\n{:task, #PID<0.165.0>, {17, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5271>, {:data, "MSG: CALLER: {#PID<0.191.0>, #Reference<0.0.0.1022>}\n{:task, #PID<0.166.0>, {18, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5272>, {:data, "MSG: CALLER: {#PID<0.192.0>, #Reference<0.0.0.1031>}\n{:task, #PID<0.167.0>, {19, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5276>, {:data, "MSG: CALLER: {#PID<0.194.0>, #Reference<0.0.0.1047>}\n{:task, #PID<0.169.0>, {21, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5275>, {:data, "MSG: CALLER: {#PID<0.193.0>, #Reference<0.0.0.1038>}\n{:task, #PID<0.168.0>, {20, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5277>, {:data, "MSG: CALLER: {#PID<0.196.0>, #Reference<0.0.0.1056>}\n{:task, #PID<0.171.0>, {23, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5274>, {:data, "MSG: CALLER: {#PID<0.195.0>, #Reference<0.0.0.1051>}\n{:task, #PID<0.170.0>, {22, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5198>, {:data, "MSG: CALLER: {#PID<0.197.0>, #Reference<0.0.0.1061>}\n{:task, #PID<0.172.0>, {24, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5275>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5271>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5276>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5277>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5272>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5273>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5274>, {:data, "OK\nEOL\n"}}
PortServer got message: {#Port<0.5198>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.169.0>, {21, \"data\"}}", "MSG: CALLER: {#PID<0.194.0>, #Reference<0.0.0.1047>}", "EOL", "OK"]
value: ["{:task, #PID<0.165.0>, {17, \"data\"}}", "MSG: CALLER: {#PID<0.190.0>, #Reference<0.0.0.1008>}", "EOL", "OK"]
value: ["{:task, #PID<0.167.0>, {19, \"data\"}}", "MSG: CALLER: {#PID<0.192.0>, #Reference<0.0.0.1031>}", "EOL", "OK"]
value: ["{:task, #PID<0.168.0>, {20, \"data\"}}", "MSG: CALLER: {#PID<0.193.0>, #Reference<0.0.0.1038>}", "EOL", "OK"]
value: ["{:task, #PID<0.166.0>, {18, \"data\"}}", "MSG: CALLER: {#PID<0.191.0>, #Reference<0.0.0.1022>}", "EOL", "OK"]
value: ["{:task, #PID<0.171.0>, {23, \"data\"}}", "MSG: CALLER: {#PID<0.196.0>, #Reference<0.0.0.1056>}", "EOL", "OK"]
value: ["{:task, #PID<0.172.0>, {24, \"data\"}}", "MSG: CALLER: {#PID<0.197.0>, #Reference<0.0.0.1061>}", "EOL", "OK"]
value: ["{:task, #PID<0.170.0>, {22, \"data\"}}", "MSG: CALLER: {#PID<0.195.0>, #Reference<0.0.0.1051>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.169.0>, {21, \"data\"}}", "MSG: CALLER: {#PID<0.194.0>, #Reference<0.0.0.1047>}", "EOL", "OK"] from #PID<0.139.0>
Work done, ["{:task, #PID<0.165.0>, {17, \"data\"}}", "MSG: CALLER: {#PID<0.190.0>, #Reference<0.0.0.1008>}", "EOL", "OK"] from #PID<0.133.0>
Work done, ["{:task, #PID<0.167.0>, {19, \"data\"}}", "MSG: CALLER: {#PID<0.192.0>, #Reference<0.0.0.1031>}", "EOL", "OK"] from #PID<0.131.0>
Work done, ["{:task, #PID<0.168.0>, {20, \"data\"}}", "MSG: CALLER: {#PID<0.193.0>, #Reference<0.0.0.1038>}", "EOL", "OK"] from #PID<0.137.0>
Work done, ["{:task, #PID<0.171.0>, {23, \"data\"}}", "MSG: CALLER: {#PID<0.196.0>, #Reference<0.0.0.1056>}", "EOL", "OK"] from #PID<0.141.0>
Work done, ["{:task, #PID<0.166.0>, {18, \"data\"}}", "MSG: CALLER: {#PID<0.191.0>, #Reference<0.0.0.1022>}", "EOL", "OK"] from #PID<0.129.0>
Work done, ["{:task, #PID<0.170.0>, {22, \"data\"}}", "MSG: CALLER: {#PID<0.195.0>, #Reference<0.0.0.1051>}", "EOL", "OK"] from #PID<0.135.0>
Work done, ["{:task, #PID<0.172.0>, {24, \"data\"}}", "MSG: CALLER: {#PID<0.197.0>, #Reference<0.0.0.1061>}", "EOL", "OK"] from #PID<0.127.0>
PortServer got message: {#Port<0.5276>, {:data, "MSG: CALLER: {#PID<0.198.0>, #Reference<0.0.0.1100>}\n{:task, #PID<0.173.0>, {25, \"data\"}}\n\n"}}
PortServer got message: {#Port<0.5276>, {:data, "OK\nEOL\n"}}
value: ["{:task, #PID<0.173.0>, {25, \"data\"}}", "MSG: CALLER: {#PID<0.198.0>, #Reference<0.0.0.1100>}", "EOL", "OK"]
Work done, ["{:task, #PID<0.173.0>, {25, \"data\"}}", "MSG: CALLER: {#PID<0.198.0>, #Reference<0.0.0.1100>}", "EOL", "OK"] from #PID<0.139.0>
[["{:task, #PID<0.149.0>, {1, \"data\"}}",
  "MSG: CALLER: {#PID<0.174.0>, #Reference<0.0.0.838>}", "EOL", "OK"],
 ["{:task, #PID<0.150.0>, {2, \"data\"}}",
  "MSG: CALLER: {#PID<0.175.0>, #Reference<0.0.0.842>}", "EOL", "OK"],
 ["{:task, #PID<0.151.0>, {3, \"data\"}}",
  "MSG: CALLER: {#PID<0.176.0>, #Reference<0.0.0.846>}", "EOL", "OK"],
 ["{:task, #PID<0.152.0>, {4, \"data\"}}",
  "MSG: CALLER: {#PID<0.177.0>, #Reference<0.0.0.850>}", "EOL", "OK"],
 ["{:task, #PID<0.153.0>, {5, \"data\"}}",
  "MSG: CALLER: {#PID<0.178.0>, #Reference<0.0.0.862>}", "EOL", "OK"],
 ["{:task, #PID<0.154.0>, {6, \"data\"}}",
  "MSG: CALLER: {#PID<0.179.0>, #Reference<0.0.0.873>}", "EOL", "OK"],
 ["{:task, #PID<0.155.0>, {7, \"data\"}}",
  "MSG: CALLER: {#PID<0.180.0>, #Reference<0.0.0.874>}", "EOL", "OK"],
 ["{:task, #PID<0.156.0>, {8, \"data\"}}",
  "MSG: CALLER: {#PID<0.181.0>, #Reference<0.0.0.876>}", "EOL", "OK"],
 ["{:task, #PID<0.157.0>, {9, \"data\"}}",
  "MSG: CALLER: {#PID<0.182.0>, #Reference<0.0.0.917>}", "EOL", "OK"],
 ["{:task, #PID<0.158.0>, {10, \"data\"}}",
  "MSG: CALLER: {#PID<0.183.0>, #Reference<0.0.0.923>}", "EOL", "OK"],
 ["{:task, #PID<0.159.0>, {11, \"data\"}}",
  "MSG: CALLER: {#PID<0.184.0>, #Reference<0.0.0.930>}", "EOL", "OK"],
 ["{:task, #PID<0.160.0>, {12, \"data\"}}",
  "MSG: CALLER: {#PID<0.185.0>, #Reference<0.0.0.943>}", "EOL", "OK"],
 ["{:task, #PID<0.161.0>, {13, \"data\"}}",
  "MSG: CALLER: {#PID<0.186.0>, #Reference<0.0.0.949>}", "EOL", "OK"],
 ["{:task, #PID<0.162.0>, {14, \"data\"}}",
  "MSG: CALLER: {#PID<0.187.0>, #Reference<0.0.0.963>}", "EOL", "OK"],
 ["{:task, #PID<0.163.0>, {15, \"data\"}}",
  "MSG: CALLER: {#PID<0.189.0>, #Reference<0.0.0.973>}", "EOL", "OK"],
 ["{:task, #PID<0.164.0>, {16, \"data\"}}",
  "MSG: CALLER: {#PID<0.188.0>, #Reference<0.0.0.971>}", "EOL", "OK"],
 ["{:task, #PID<0.165.0>, {17, \"data\"}}",
  "MSG: CALLER: {#PID<0.190.0>, #Reference<0.0.0.1008>}", "EOL", "OK"],
 ["{:task, #PID<0.166.0>, {18, \"data\"}}",
  "MSG: CALLER: {#PID<0.191.0>, #Reference<0.0.0.1022>}", "EOL", "OK"],
 ["{:task, #PID<0.167.0>, {19, \"data\"}}",
  "MSG: CALLER: {#PID<0.192.0>, #Reference<0.0.0.1031>}", "EOL", "OK"],
 ["{:task, #PID<0.168.0>, {20, \"data\"}}",
  "MSG: CALLER: {#PID<0.193.0>, #Reference<0.0.0.1038>}", "EOL", "OK"],
 ["{:task, #PID<0.169.0>, {21, \"data\"}}",
  "MSG: CALLER: {#PID<0.194.0>, #Reference<0.0.0.1047>}", "EOL", "OK"],
 ["{:task, #PID<0.170.0>, {22, \"data\"}}",
  "MSG: CALLER: {#PID<0.195.0>, #Reference<0.0.0.1051>}", "EOL", "OK"],
 ["{:task, #PID<0.171.0>, {23, \"data\"}}",
  "MSG: CALLER: {#PID<0.196.0>, #Reference<0.0.0.1056>}", "EOL", "OK"],
 ["{:task, #PID<0.172.0>, {24, \"data\"}}",
  "MSG: CALLER: {#PID<0.197.0>, #Reference<0.0.0.1061>}", "EOL", "OK"],
 ["{:task, #PID<0.173.0>, {25, \"data\"}}",
  "MSG: CALLER: {#PID<0.198.0>, #Reference<0.0.0.1100>}", "EOL", "OK"]]
```

```
iex(4)> length values
25
```
