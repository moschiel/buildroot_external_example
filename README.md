**Buildroot External Example**

Este repositório serve como um exemplo de como integrar pacotes externos ao Buildroot, utilizando submódulos e scripts para facilitar a configuração e a geração de imagens customizadas para sistemas embarcados.

**Estrutura do Repositório**
extern/: Diretório contendo pacotes externos e configurações customizadas.
configs/: Arquivos de configuração (defconfig) personalizados.
package/: Pacotes externos de exemplo (morning, afternoon, night).
buildroot/: Submódulo do Buildroot.

Scripts na raiz: Scripts auxiliares para facilitar o uso do Buildroot e a geração de imagens:
clear_build.sh: Limpa os arquivos de build anteriores.
runqemu.sh: Script para executar o QEMU com a imagem gerada.
save_custom_defconfig.sh: Salva a configuração atual como um defconfig customizado.
set_custom_defconfig.sh: Define o uso do defconfig customizado.
set_default_defconfig.sh: Define o uso do defconfig padrão fornecido pelo buildroot.
variables.sh: Contém variáveis de ambiente utilizadas pelos outros scripts.

**Como Clonar o Repositório**
Para clonar este repositório juntamente com o submódulo do Buildroot, utilize:
git clone --recurse-submodules https://github.com/moschiel/buildroot_external_example.git
cd buildroot_external_example

**Utilização dos Scripts**
O repositório inclui scripts na raiz do projeto para auxiliar na configuração e compilação do Buildroot:
**Definir o Defconfig:**
Para usar o defconfig customizado: ./set_custom_defconfig.sh

Para retornar ao defconfig padrão: ./set_default_defconfig.sh

Gerar um Novo Defconfig (opcional): ./save_custom_defconfig.sh
Isso salva a configuração atual como um novo defconfig na pasta extern/configs/.

Limpar Builds Anteriores (opcional): ./clear_build.sh
Isso remove arquivos de build anteriores para uma compilação limpa.

Compilar a Imagem:
cd buildroot
make
Isso inicia o processo de compilação do Buildroot utilizando as configurações definidas.

Executar a Imagem no QEMU (opcional): ./runqemu.sh
Isso executa a imagem gerada no QEMU para testes.

**Adicionando Novos Pacotes Externos**
Para adicionar novos pacotes externos:

Crie o Pacote: Siga a estrutura dos pacotes de exemplo na pasta extern/package/.

**Atualize o **``: Inclua o novo pacote no arquivo extern/package/Config.in para que ele apareça no menuconfig.

Configure o Buildroot: Execute make menuconfig dentro do diretório buildroot/, navegue até External Options e selecione o novo pacote.

Compile a Imagem: Utilize o script make dentro do diretório buildroot para compilar a imagem com o novo pacote incluído.