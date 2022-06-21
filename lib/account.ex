defmodule Account do
  defstruct user: User, balance: 0

  def create(user) do
    %__MODULE__{user: user}
  end

end
