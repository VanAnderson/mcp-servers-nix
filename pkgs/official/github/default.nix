{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "github-mcp-server";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "github";
    repo = "github-mcp-server";
    tag = "v${version}";
    hash = "sha256-qgCysZMGyiuqBBvvbh5KmQ8tu0XhWcKihc9Z07Lw/kA=";
  };

  vendorHash = "sha256-+w3xsbzvTkNfnFxIM8k339soqFOUGETA+KMNABoUKFY=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${version}"
    "-X=main.commit=${src.rev}"
    "-X=main.date=1970-01-01T00:00:00Z"
  ];

  __darwinAllowLocalNetworking = true;

  meta = {
    description = "GitHub's official MCP Server";
    homepage = "https://github.com/github/github-mcp-server";
    changelog = "https://github.com/github/github-mcp-server/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ natsukium ];
    mainProgram = "github-mcp-server";
  };
}
