## Vagrant installation of skydns/etcd/vulcand infrastructure simulation.

This project aims to provide a simple vagrant set up for a reference architecture of a skydns/vulcand/etcd environment.

### Diagram of Setup
```

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
```

### Quick Start
1. git clone https://github.com/jcmturner/core-ip-services.git && cd core-ip-services
2. vagrant up
3. curl -XPUT http://10.80.31.11:4001/v2/keys/skydns/com/coreip-a/test -d value='{"host":"1.2.3.4"}'
4. curl -XPUT http://10.80.32.11:4001/v2/keys/skydns/com/coreip-b/test -d value='{"host":"4.3.2.1"}'
5. dig @10.80.10.11 +noall +answer test.coreip-a.com
6. dig @10.80.10.11 +noall +answer test.coreip-b.com

### TO DO
* Integrate vulcand
* Use TLS for etcd cluster communications
* Enable DNSsec
