#!/bin/bash
#检测nginx是否启动了
A=`ps -C nginx --no-header |wc -l`        
if [ $A -eq 0 ];then    #如果nginx没有启动就启动nginx                        
      /usr/local/nginx/sbin/nginx                #重启nginx
      if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then    #nginx重启失败，则停掉keepalived服务，进行VIP转移
              killall keepalived                    
      fi
fi
