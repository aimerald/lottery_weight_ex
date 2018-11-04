defmodule WeightLottery do
  @moduledoc """
  Documentation for WeightLottery.
  """

  @doc """
  WeightLottery.cast_lot/1

  ## Examples
	items is %WeightLottery.item struct array
	items = [
    %WeightLottery.Item { value: 'starters', weight: 10 },
    %WeightLottery.Item { value: 'experimental', weight: 30 }
  ]
	WeightLottery.cast_lot(items)
  Experimental
  """
	def cast_lot(items) do
		total_weight = total_weight(items)
		lottery_number = :rand.uniform(total_weight) - 1
		cast_lot(items, lottery_number)
	end

	def cast_lot(items, lottery_number) do
		[h|t] = items
		cast_lot(h, t, lottery_number)
	end

	def cast_lot(item, items, lottery_number) do
		if item.weight > lottery_number do
			item.value
		else
			[h|t] = items
			cast_lot(h, t, (lottery_number - item.weight))
		end
	end

	defp total_weight(items) do
		items
		|> Enum.map(&(&1.weight))
		|> Enum.sum
	end
end
