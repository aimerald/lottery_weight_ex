defmodule WeightLotteryTest do
  use ExUnit.Case

  doctest WeightLottery

	test "#cast_lot return weight lottery" do
		items = [
			%WeightLottery.Item { value: 'alpha', weight: 3 },
			%WeightLottery.Item { value: 'beta', weight: 10 },
			%WeightLottery.Item { value: 'gannma', weight: 50 },
			%WeightLottery.Item { value: 'delta', weight: 120 },
		]
		result = WeightLottery.cast_lot(items)
		assert items
		|> Enum.any?(&(&1.value == result))
	end

	test '#cast_lot return with probability' do
		items = [
			%WeightLottery.Item { value: 'alpha', weight: 3 },
			%WeightLottery.Item { value: 'beta', weight: 7 },
			%WeightLottery.Item { value: 'gannma', weight: 20 },
			%WeightLottery.Item { value: 'delta', weight: 70 },
		]
		results = (1..10000)
		|> Enum.map( fn _ -> WeightLottery.cast_lot(items) end)
		alpha_count = select_and_count(results, 'alpha')
		beta_count = select_and_count(results, 'beta')
		gannma_count = select_and_count(results, 'gannma')
		delta_count = select_and_count(results, 'delta')

		assert (200..400) |> Enum.member?(alpha_count)
		assert (600..800) |> Enum.member?(beta_count)
		assert (1900..2100) |> Enum.member?(gannma_count)
		assert (6900..7100) |> Enum.member?(delta_count)
	end

	def select_and_count(results, cond_name) do
		results
		|> Enum.filter(&(&1 == cond_name))
		|> Enum.count
	end
end
