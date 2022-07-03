defmodule Account do
  defstruct user: User, balance: 1000

  def create(user) do
    cond do
      user.name == "" or user.email == "" -> {:error, "Cadastre um nome e um email"}
      true ->
        %__MODULE__{user: user}

    end
  end

  def deposit(userAccount, value) do

      cond do
        value < 0 -> {:error, "Saldo insuficiente"}

        true ->
          userAccount = %Account{userAccount | balance: userAccount.balance + value}

          {:success, userAccount}

    end
  end

  def transfer(accounts, of, to, value) do
    of = Enum.find(accounts, fn account -> account.user.email == of.user.email end)

    cond do
      validate_balance(of.balance, value) -> {:error, "Saldo insuficiente"}
      true ->
        to = Enum.find(accounts, fn account -> account.user.email == to.user.email end)
        of = %Account{of | balance: of.balance - value}
        to = %Account{to | balance: to.balance + value}
        [of, to]
    end
  end

  def withdraw(account, value) do
    cond do
      validate_balance(account.balance, value) -> {:error, "Saldo insuficiente para sacar"}

      true ->
        account = %Account{account | balance: account.balance - value}
        {:ok, account, "Saque completado com sucesso"}

    end
  end

  def validate_balance(balance, value) do
    balance < value
  end
end
