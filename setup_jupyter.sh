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

Este projeto usa uma venv local chamada:

\`\`\`bash
$NOME_VENV
\`\`\`

Kernel registrado no Jupyter:

\`\`\`text
$NOME_EXIBICAO_KERNEL
\`\`\`

---

## Ativar a venv

No terminal, dentro da pasta do projeto:

\`\`\`bash
source $NOME_VENV/bin/activate
\`\`\`

---

## Parar / sair da venv

Para sair da venv:

\`\`\`bash
deactivate
\`\`\`

---

## Abrir o Jupyter pelo navegador

Com a venv ativada, rode:

\`\`\`bash
jupyter notebook
\`\`\`

Depois acesse pelo navegador usando o link que aparecer no terminal.

Normalmente será algo parecido com:

\`\`\`text
http://localhost:8888/tree
\`\`\`

---

## Usar no VS Code

1. Abra um arquivo \`.ipynb\`
2. Clique em selecionar kernel
3. Escolha:

\`\`\`text
$NOME_EXIBICAO_KERNEL
\`\`\`

---

## Instalar dependências dentro do notebook

As dependências da aplicação podem ser instaladas direto em uma célula do notebook:

\`\`\`python
%pip install pandas numpy openpyxl matplotlib
\`\`\`

Para FaceNet, um exemplo seria:

\`\`\`python
%pip install facenet-pytorch torch torchvision pillow opencv-python
\`\`\`

---

## Observação

A venv guarda o ambiente Python.

O kernel permite que o Jupyter ou o VS Code usem essa venv nos notebooks.
EOF

echo "======================================"
echo "Ambiente pronto!"
echo "======================================"
echo ""
echo "Arquivo criado:"
echo "$ARQUIVO_ACESSO"
echo ""
echo "Para ativar manualmente:"
echo "source $NOME_VENV/bin/activate"
echo ""
echo "Para abrir o Jupyter no navegador:"
echo "jupyter notebook"
echo ""
echo "No VS Code, escolha o kernel:"
echo "$NOME_EXIBICAO_KERNEL"
