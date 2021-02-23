import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.StandardHost;
import ned.DatarateChannel;


network WiredSenario
{
    parameters:
        int numClients;
        @display("bgb=915,493");

    types:
        channel Ether1G extends DatarateChannel
        {
            delay = 0.1us;
            datarate = 1000Mbps;
        }

    submodules:
        host2[numClients]: StandardHost {
            @display("p=264,405");
        }

        server: StandardHost {
            @display("p=444.56625,44.80125;i=device/server");
        }

        host1[numClients]: StandardHost {
            @display("p=103,411");
        }

        centralSwitch: EtherSwitch {
            @display("p=444.56625,197.585");
        }

        etherSwitch1: EtherSwitch {
            @display("p=96.495,188.395");
            gates:
                ethg[numClients];
        }

        etherSwitch2: EtherSwitch {
            @display("p=263.06375,188.395");
            gates:
                ethg[numClients];
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=113.72625,44.80125");
        }

        etherSwitch4: EtherSwitch {
            @display("p=603.09375,188.395");
            gates:
                ethg[numClients];
        }
        host4[numClients]: StandardHost {
            @display("p=611.135,410.10376");
        }

        etherSwitch3: EtherSwitch {
            @display("p=444.56625,300.9725");
            gates:
                ethg[numClients];
        }

        host3[numClients]: StandardHost {
            @display("p=444.56625,427.335");
        }

        host5[numClients]: StandardHost {
            @display("p=822.505,404.36002");

        }

        etherSwitch5: EtherSwitch {
            @display("p=790.34,188.395");
            gates:
                ethg[numClients];
        }

    connections:
        etherSwitch1.ethg++ <--> Ether1G <--> centralSwitch.ethg++;
        etherSwitch2.ethg++ <--> Ether1G <--> centralSwitch.ethg++;
        etherSwitch3.ethg++ <--> Ether1G <--> centralSwitch.ethg++;
        etherSwitch4.ethg++ <--> Ether1G <--> centralSwitch.ethg++;
        etherSwitch5.ethg++ <--> Ether1G <--> centralSwitch.ethg++;
        centralSwitch.ethg++ <--> Ether1G <--> server.ethg++;


        for a=0..numClients-1 {
            host1[a].ethg++ <--> Ether1G <--> etherSwitch1.ethg++;
        }

        for b=0..numClients-1 {
            host2[b].ethg++ <--> Ether1G <--> etherSwitch2.ethg++;
        }

        for c=0..numClients-1 {
            host3[c].ethg++ <--> Ether1G <--> etherSwitch3.ethg++;
        }

        for d=0..numClients-1 {
            host4[d].ethg++ <--> Ether1G <--> etherSwitch4.ethg++;
        }

        for e=0..numClients-1 {
            host5[e].ethg++ <--> Ether1G <--> etherSwitch5.ethg++;
        }

}
