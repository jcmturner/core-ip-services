## Vagrant installation of skydns/etcd/vulcand infrastructure simulation.

### Diagram of Setup

                                        DNS Query                                        
                                            |                                            
                                            |                                            
                                            |                                            
                            +---------------v---------------+                            
                            |                               |                            
                            |  Existing DNS Infrastructure  |                            
                            |            (bind1)            |                            
                            |                               |                            
                            +---+-----------------------+---+                            
                                |                       |                                
                       forwards |                       | forwards                       
                                |                       |                                
   +----------------------------v----+              +---v-----------------------------+   
   |                                 |              |                                 |   
   |  SkyDNS for zone: coreip-a.com  |              |  SkyDNS for zone: coreip-b.com  |   
   |         (skydns-a1..2)          |              |         (skydns-b1..2)          |   
   |                                 |              |                                 |   
   +---------------+-----------------+              +---------------+-----------------+   
                   |                                                |                    
              data |                                                | data               
                   |                                                |                    
+------------------v--------------------+        +------------------v--------------------+
|                                       |        |                                       |
|  etcd Cluster for zone: coreip-a.com  |        |  etcd Cluster for zone: coreip-b.com  |
|             (etcd-a1..3)              |        |             (etcd-b1..3)              |
|                                       |        |                                       |
+------------------^--------------------+        +------------------^--------------------+
                   |                                                |                    
                   |                                                |                    
          API CRUD operations                              API CRUD operations           



### TO DO
* Implement the "b" leg
* Integrate vulcand
* Use TLS for etcd cluster communications
* Put some example entries in on vagrant up
