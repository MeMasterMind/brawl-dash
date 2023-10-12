-- ::::::::::::::::::::::::::::::::::::@@@@@:::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::@@@::-@@%::   ____                     _    ::
-- :::::::::::::::::::::::::::::::::@@#::::@@%::  |  _ \                   | |   ::
-- ::::::::::::#@@@@@@@@@@@@@@@@@@@-@@:::@@@=:::  | |_) |_ __ __ ___      _| |   ::
-- ::::::::::::@@::@@@:::::::::::@@@@@:::@@:::::  |  _ <| '__/ _` \ \ /\ / / |   ::
-- ::::::::::::@@:=@@:::::::::::::@@@@:::@@:::::  | |_) | | | (_| |\ V  V /| |   ::
-- ::::::::::::@@:=@@%###########%@@@@:::@@=::::  |____/|_|  \__,_| \_/\_/ |_|   ::
-- :::::::::::-@@:=@@@@::::#@-::-@@@@@::::@@::::                                 ::
-- ::::::%@@%%@@@:=@@@#::::-@::::@@@@@#:::%@::::   _____            _            ::
-- ::::=@@%:::@@@:=@@@@::::#@-:::@@@@@@@+@@@::::  |  __ \          | |           ::
-- :::@@%:::@@@@@::@@@+++++++++++*@@@@@@@@@@@:::  | |  | | __ _ ___| |__         ::
-- :::@#:::=@@@@@@-@=::#@@:::::::::#@@@@@+#@@:::  | |  | |/ _` / __| '_ \        ::
-- :::@#::::-@@:@@@@=:::@+:#@@:-@@+#@@@+::#@@:::  | |__| | (_| \__ \ | | |       ::
-- :::@@:::*@@+:#@@@@-::::::+-::-=:%@@::::#@@:::  |_____/ \__,_|___/_| |_|       ::
-- :::@@@@@@#::@@@@@@@@%%%%%%%%%%@@@@@@-:@@@-:::                                 ::
-- :::::::::=++@@%::-@@-----=@@=#@@::@@@@@=:::::  Mod Menu v1.0          by kk   ::
-- :::::::::*::@@:::=@#::::::@@::@@@::::::::::::                                 ::
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

TargetInfo = gg.getTargetInfo()
TargetPackage = gg.getTargetPackage()

if TargetPackage ~= "com.For7ius.TBuzz" then
  gg.alert("[❌️] This script was written for Brawl Dash (com.For7ius.TBuzz) but you are attached to " .. TargetInfo.label .. " (" .. TargetPackage .. "). Attach to the correct process and try again.")
  os.exit()
end

function Home()
  local menu = gg.choice({
    "~~~~~~~ MAIN MENU ~~~~~~~",
    "╔》[💰] Change coins amount",
    "╠》[💎] Change gems amount",
    "╠》[🎁] Show promo codes",
    "╚》[🚀] Speedhack",
    "~~~~~~ OTHER STUFF ~~~~~~",
    "╔》[👾] View patch notes",
    "╚》[❌️] Exit"
    }, nil, "🔰 BD Mod Menu by kk")


  -- CHANGE COINS AMOUNT
  if menu == 2 then
    local confirm = gg.alert("[❓️] Are you sure? You will need to spend / get some coins to activate. (If no, cancel on next prompt)")

    -- confirmation prompt 
    if confirm ~= nil then
      local askCoinsOne = gg.prompt({"[💰] How many coins do you have right now?"})

      -- ask coins amount (1st time)
      if askCoinsOne ~= nil then
        gg.searchNumber(askCoinsOne[1])
        gg.alert("[❗️] Now get / spend some coins. You have 20s time then script will continue.")
        gg.sleep(20000)
        local askCoinsTwo = gg.prompt({"[💰] How many coins do you have now?"})

        -- ask coins amount (2nd time)
        if askCoinsTwo ~= nil then
          gg.searchNumber(askCoinsTwo[1])
          gg.getResults(10) -- get the first 10 results

          -- check if there are results
          if gg.getResultsCount() == 0 then
            gg.alert("[❌️] No results found! Make sure you input the amount of coins correctly.")
          else
            local newCoins = gg.prompt({"[✅️] Results found. How many coins do you **want** to have?"})

            -- ask how many coins user wants to have
            if newCoins ~= nil then
              gg.editAll(newCoins[1], gg.TYPE_DWORD)
              gg.alert("[✅️] Set coins amount to " .. newCoins[1] .. ". Now start a match and exit, and you should have your coins.")
            end
          end
        end
      end
    end
  end

  -- CHANGE GEMS AMOUNT
  if menu == 3 then
    local confirm = gg.alert("[❓️] Are you sure? You will need to spend / get some gems to activate. (If no, cancel on next prompt)")

    -- confirmation prompt 
    if confirm ~= nil then
      local askGemsOne = gg.prompt({"[💎] How many gems do you have right now?"})

      -- ask gems amount (1st time)
      if askGemsOne ~= nil then
        gg.searchNumber(askGemsOne[1])
        gg.alert("[❗️] Now get / spend some gems. You have 20s time then script will continue.")
        gg.sleep(20000)
        local askGemsTwo = gg.prompt({"[💎] How many gems do you have now?"})

        -- ask gems amount (2nd time)
        if askGemsTwo ~= nil then
          gg.searchNumber(askGemsTwo[1])
          gg.getResults(10) -- get the first 10 results

          -- check if there are results
          if gg.getResultsCount() == 0 then
            gg.alert("[❌️] No results found! Make sure you input the amount of gems correctly.")
          else
            local newGems = gg.prompt({"[✅️] Results found. How many gems do you **want** to have?"})

            -- ask how many gems user wants to have
            if newGems ~= nil then
              gg.editAll(newGems[1], gg.TYPE_DWORD)
              gg.alert("[✅️] Set gems amount to " .. newGems[1] .. ". Now start a match and exit, and you should have your gems.")
            end
          end
        end
      end
    end
  end

  -- SHOW PROMO CODES
  if menu == 4 then
    gg.alert("[❗️] This action requires internet connection.")
    local promoCodes = gg.makeRequest("https://raw.githubusercontent.com/kk-dev7/brawl-dash/main/Promo_Codes.md").content
    if not promoCodes then
      gg.alert("[❌️] An error occured, check your internet connection!")
    else
      gg.alert(promoCodes)
    end

  end

  -- SPEEDHACK
  if menu == 5 then
    -- [0.0000000010; 1000000000]
    local askSpeed = gg.prompt({"[🚀] Enter speed: (currently: " .. gg.getSpeed() .. ")"},{[1]=1}, {[1]="number"})
    if askSpeed ~= nil then
      -- if the user entered a valid number
      if tonumber(askSpeed[1]) then
        gg.setSpeed(askSpeed[1])
        gg.toast("[✅️] Speed set")
      else
        gg.alert("[❌️] Please specify a number!")
      end
    end
  end

  -- VIEW PATCH NOTES
  if menu == 7 then
    gg.alert("v1.0 initial release\n\n\n\nThis script was made for people without any GG experience. You can easily search and replace the values yourself. Making this script wasnt very hard, just a bit of lua knowledge and reading the GG docs. Have a nice day :D")
  end

  -- EXIT
  if menu == 8 then
    os.exit()
  end
end

while true do
	if gg.isVisible() then
		gg.setVisible(false)
		Home()
	end
	gg.sleep(100)
end