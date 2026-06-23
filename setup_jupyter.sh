#!/usr/bin/env bash

set -e

NOME_VENV=".venv"
NOME_KERNEL="notebook-facenet-venv"
NOME_EXIBICAO_KERNEL="Notebook FaceNet Venv"
ARQUIVO_ACESSO="Acesso.md"

echo "======================================"
echo "Configurando ambiente Jupyter local"
echo "======================================"

if ! command -v python3 >/dev/null 2>&1; then
    echo "Erro: python3 não encontrado."
    echo "Instale com:"
    echo "sudo apt install python3 python3-venv python3-pip"
    exit 1
fi

if [ ! -d "$NOME_VENV" ]; then
    echo "Criando venv em $NOME_VENV..."
    python3 -m venv "$NOME_VENV"
else
    echo "Venv já existe em $NOME_VENV."
fi

echo "Ativando venv..."
source "$NOME_VENV/bin/activate"

echo "Atualizando ferramentas básicas do Python..."
python -m pip install --upgrade pip setuptools wheel

echo "Instalando Jupyter e suporte ao kernel..."
python -m pip install \
    jupyter \
    ipykernel

echo "Registrando kernel do Jupyter..."
python -m ipykernel install \
    --user \
    --name "$NOME_KERNEL" \
    --display-name "$NOME_EXIBICAO_KERNEL"

echo "Criando arquivo $ARQUIVO_ACESSO..."

cat > "$ARQUIVO_ACESSO" <<EOF
# Acesso ao ambiente Jupyter

Projeto:

\`\`\`text
Univali TB3 - Inteligência Artificial 2
\`\`\`

Este projeto usa uma venv local chamada:

\`\`\`text
$NOME_VENV
\`\`\`

Kernel registrado no Jupyter:

\`\`\`text
$NOME_EXIBICAO_KERNEL
\`\`\`

---

## O que foi criado pelo setup

Depois de rodar o script \`setup_jupyter.sh\`, serão criados:

\`\`\`text
.venv
Acesso.md
\`\`\`

---

# Linux/macOS

## Ativar a venv

\`\`\`bash
source .venv/bin/activate
\`\`\`

## Sair/parar a venv

\`\`\`bash
deactivate
\`\`\`

## Abrir o Jupyter

\`\`\`bash
jupyter notebook
\`\`\`

---

# Windows com Git Bash

## Ativar a venv

\`\`\`bash
source .venv/Scripts/activate
\`\`\`

## Sair/parar a venv

\`\`\`bash
deactivate
\`\`\`

## Abrir o Jupyter

\`\`\`bash
jupyter notebook
\`\`\`

---

# Windows com PowerShell

## Ativar a venv

\`\`\`powershell
.venv\\Scripts\\Activate.ps1
\`\`\`

## Sair/parar a venv

\`\`\`powershell
deactivate
\`\`\`

## Abrir o Jupyter

\`\`\`powershell
jupyter notebook
\`\`\`

---

# Windows com CMD

## Ativar a venv

\`\`\`cmd
.venv\\Scripts\\activate.bat
\`\`\`

## Sair/parar a venv

\`\`\`cmd
deactivate
\`\`\`

## Abrir o Jupyter

\`\`\`cmd
jupyter notebook
\`\`\`

---

# Acessar o Jupyter no navegador

Depois de rodar:

\`\`\`bash
jupyter notebook
\`\`\`

O terminal vai mostrar um link parecido com:

\`\`\`text
http://localhost:8888/tree
\`\`\`

Abra esse link no navegador.

---

# Usar no VS Code

1. Abra um arquivo \`.ipynb\`
2. Clique em **Select Kernel**
3. Escolha:

\`\`\`text
$NOME_EXIBICAO_KERNEL
\`\`\`

---

# Instalar dependências dentro do notebook

As dependências da atividade podem ser instaladas direto em uma célula do notebook:

\`\`\`python
%pip install pandas numpy openpyxl matplotlib
\`\`\`

Exemplo para FaceNet:

\`\`\`python
%pip install facenet-pytorch torch torchvision pillow opencv-python
\`\`\`

---

# Observação

A venv guarda os pacotes Python do projeto.

O kernel permite que o Jupyter e o VS Code usem essa venv nos notebooks.
EOF

echo "======================================"
echo "Ambiente pronto!"
echo "======================================"
echo ""
echo "Arquivo criado:"
echo "$ARQUIVO_ACESSO"
echo ""
echo "Para ativar manualmente no Linux/macOS:"
echo "source $NOME_VENV/bin/activate"
echo ""
echo "Para abrir o Jupyter no navegador:"
echo "jupyter notebook"
echo ""
echo "No VS Code, escolha o kernel:"
echo "$NOME_EXIBICAO_KERNEL"