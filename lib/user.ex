defmodule User do
  defstruct name: nil, email: nil

  def create(name, email) do
    cond do
      name == "" or email == "" -> {:error, "Cadastre um nome e um email"}
      true ->
        %__MODULE__{name: name, email: email}

    end
  end
end
