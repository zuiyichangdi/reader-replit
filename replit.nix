{ pkgs }: {
    deps = [
        pkgs.wget
        pkgs.jq.bin
        pkgs.openjdk11-bootstrap
        pkgs.bashInteractive
    ];
}
