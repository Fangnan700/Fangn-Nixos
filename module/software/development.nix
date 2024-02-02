{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  environment.systemPackages = with pkgs; [
    go

    # pkgs-unstable.etcd
    # pkgs-unstable.redis
    # pkgs-unstable.mysql80

    pkgs-unstable.protobuf
    pkgs-unstable.go-protobuf
    pkgs-unstable.protoc-gen-go
    pkgs-unstable.protoc-gen-go-grpc
  ];
}

