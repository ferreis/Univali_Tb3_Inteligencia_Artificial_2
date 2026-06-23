# Notebook FaceNet

Este projeto usa um script chamado `setup_jupyter.sh` para configurar o ambiente local do Jupyter.

Ao rodar o script, ele vai criar automaticamente:

```text
.venv
Acesso.md
```

## O que o script faz?

O script `setup_jupyter.sh` faz estas etapas:

1. Verifica se o `python3` está instalado.
2. Cria uma venv local chamada `.venv`.
3. Ativa a venv.
4. Atualiza `pip`, `setuptools` e `wheel`.
5. Instala o Jupyter e o `ipykernel`.
6. Registra a venv como kernel do Jupyter.
7. Cria o arquivo `Acesso.md` com instruções de uso.

---

# Requisitos

Antes de rodar o script, é necessário ter o Python instalado.

## Linux Ubuntu/Debian

Instale com:

```bash
sudo apt update
sudo apt install python3 python3-venv python3-pip
```

## Windows

Instale o Python pelo site oficial:

```text
https://www.python.org/downloads/
```

Durante a instalação, marque a opção:

```text
Add Python to PATH
```

Depois confirme no terminal:

```powershell
python --version
```

ou:

```powershell
py --version
```

## macOS

Instale o Python pelo Homebrew:

```bash
brew install python
```

Depois confirme:

```bash
python3 --version
```

---

# Como rodar no Linux

Entre na pasta do projeto:

```bash
cd caminho/para/Notebook_FaceNet
```

Dê permissão de execução ao script:

```bash
chmod +x setup_jupyter.sh
```

Rode o script:

```bash
./setup_jupyter.sh
```

Alternativa sem usar `chmod`:

```bash
bash setup_jupyter.sh
```

---

# Como rodar no macOS

Entre na pasta do projeto:

```bash
cd caminho/para/Notebook_FaceNet
```

Dê permissão de execução ao script:

```bash
chmod +x setup_jupyter.sh
```

Rode o script:

```bash
./setup_jupyter.sh
```

Alternativa sem usar `chmod`:

```bash
bash setup_jupyter.sh
```

---

# Como rodar no Windows

O script `setup_jupyter.sh` é um script Bash.

No Windows, rode usando uma destas opções:

* Git Bash
* WSL
* Terminal com Bash disponível

## Opção 1 — Git Bash

Abra o **Git Bash** na pasta do projeto e rode:

```bash
bash setup_jupyter.sh
```

## Opção 2 — WSL

Abra o terminal do WSL, entre na pasta do projeto e rode:

```bash
bash setup_jupyter.sh
```

---

# Depois de rodar o script

Depois que o script terminar, estes arquivos/pastas serão criados:

```text
.venv
Acesso.md
```

## `.venv`

É o ambiente virtual Python do projeto.

Ele guarda os pacotes instalados para este notebook.

## `Acesso.md`

É um arquivo com instruções rápidas sobre:

* Como ativar a venv.
* Como sair/parar a venv.
* Como abrir o Jupyter.
* Como usar o kernel no VS Code.
* Como instalar dependências dentro do notebook.

---

# Como ativar a venv manualmente

## Linux/macOS

```bash
source .venv/bin/activate
```

## Windows com Git Bash

```bash
source .venv/Scripts/activate
```

## Windows com PowerShell

```powershell
.venv\Scripts\Activate.ps1
```

---

# Como sair/parar a venv

Em qualquer sistema:

```bash
deactivate
```

---

# Como abrir o Jupyter

Com a venv ativada, rode:

```bash
jupyter notebook
```

Depois abra no navegador o link que aparecer no terminal.

Normalmente será algo parecido com:

```text
http://localhost:8888/tree
```

---

# Como usar no VS Code

1. Abra o projeto no VS Code.
2. Abra um arquivo `.ipynb`.
3. Clique em **Select Kernel**.
4. Escolha o kernel:

```text
Notebook FaceNet Venv
```

---

# Como instalar dependências da aplicação

As dependências específicas do notebook podem ser instaladas dentro de uma célula do próprio notebook.

Exemplo:

```python
%pip install pandas numpy openpyxl matplotlib
```

Para FaceNet, um exemplo seria:

```python
%pip install facenet-pytorch torch torchvision pillow opencv-python
```

---

# Observação importante

O script instala apenas o ambiente base para rodar notebooks com Jupyter.

As bibliotecas específicas da aplicação podem ser instaladas dentro do notebook, conforme a necessidade.
