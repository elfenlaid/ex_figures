defmodule ExFigures.Root do
  @moduledoc """
  The [/](https://docs.appfigures.com/api/reference/v2/root)(root) resource provides
  basic information about the currently authenticated user.
  """

  @doc """
  The root resource provides basic information about the currently authenticated user.
  """
  @spec get(ExFigures.t()) :: ExFigures.result()
  def get(client) do
    Tesla.get(client, "/")
  end
end
