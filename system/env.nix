{ config, pkgs, ... }:

{
  environment.sessionVariables = rec {
    # HTTP_PROXY = "http://127.0.0.1:7890";
    # HTTPS_PROXY = "http://127.0.0.1:7890";
  };
}