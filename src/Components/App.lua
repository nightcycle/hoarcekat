local Hoarcekat = script:FindFirstAncestor("Hoarcekat")

local Roact = require(Hoarcekat.Vendor.Roact)

local Preview = require(script.Parent.Preview)
local Sidebar = require(script.Parent.Sidebar)
local StudioThemeAccessor = require(script.Parent.StudioThemeAccessor)

local createElement = Roact.createElement

local function App()
	return createElement(StudioThemeAccessor, {}, {
		function(theme)
			return createElement("Frame",
				{
					BackgroundColor3 = theme:GetColor("MainBackground", "Default"),
					Size = UDim2.fromScale(1, 1),
				},
				{
					Sidebar = createElement("Frame",
						{
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
						},
						{
							Sidebar = createElement(Sidebar),
						}
					),

					Preview = createElement("Frame",
						{
							AnchorPoint = Vector2.new(1, 0),
							BackgroundTransparency = 1,
							Position = UDim2.fromScale(1, 0),
							Size = UDim2.fromScale(0.8, 1),
							Visible = false,
						},
						{
							Preview = createElement(Preview),
						}
					),
				}
			)
		end,
	})
end

return App
