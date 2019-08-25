defmodule Extatistical.Services.Statisticals do
  @moduledoc """

  """
  require Logger

  alias Extatistical.Utils.Environments

  @doc """

  """
  def run_r(r_file, function_arguments \\ []) when is_binary(r_file) and is_list(function_arguments) do
    r_file = "#{Environments.get_env({:system, "R_SCRIPTS_PATH"})}#{r_file}"

    if File.exists?(r_file) do
      function_arguments = [r_file] ++ function_arguments
      case System.cmd("Rscript", function_arguments) do
        {result, 0} ->
          {:ok, Poison.decode!(Base.decode64!(result))}

        {_, _} ->
          {:error, :not_processed}
      end
    else
      {:error, :file_not_exists}
    end
  end
end
