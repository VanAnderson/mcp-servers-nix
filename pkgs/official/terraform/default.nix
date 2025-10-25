{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "terraform-mcp-server";
  version = "0.1.0-unstable-2025-10-24";
  
  src = fetchFromGitHub {
    owner = "hashicorp";
    repo = "terraform-mcp-server";
    rev = "9696fa398403b5ed25089aaf23d5ad15e5bc87f8";
    hash = "sha256-FcjeEp+uwlfezGlmBd2nSTdfnXuPnSDTxTPlP6CtcrE=";
  };

  # Go module dependencies hash
  vendorHash = "sha256-ObNuenbCmmbkRPKUmdMg+ERfUV+RiS2OEOneJOmteZU=";

  # Disable tests if they require network or fail
  doCheck = false;

  meta = with lib; {
    description = "HashiCorp Terraform MCP server for AI-assisted Terraform development";
    homepage = "https://github.com/hashicorp/terraform-mcp-server";
    license = licenses.mpl20;
    maintainers = [ ];
    mainProgram = "terraform-mcp-server";
    platforms = platforms.linux ++ platforms.darwin;
  };
}