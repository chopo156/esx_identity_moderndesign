--==================================================================================
--======               ESX_IDENTITY BY ARKSEYONET @Ark                        ======
--======    YOU CAN FIND ME ON MY DISCORD @Ark - https://discord.gg/cGHHxPX   ======
--======    IF YOU ALTER THIS VERSION OF THE SCRIPT, PLEASE GIVE ME CREDIT    ======
--======     Special Thanks To Alphakush and CMD.Telhada For Help Testing     ======
--==================================================================================

--===============================================
--==                 VARIABLES                 ==
--===============================================
local guiEnabled = false
local myIdentity = {}

--===============================================
--==                 VARIABLES                 ==
--===============================================
function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

function openRegistry()
  TriggerEvent('esx_identity:showRegisterIdentity')
end

--===============================================
--==           Show Registration               ==
--===============================================
RegisterNetEvent("esx_identity:showRegisterIdentity")
AddEventHandler("esx_identity:showRegisterIdentity", function()
  EnableGui(true)
end)

--===============================================
--==           Register Callback               ==
--===============================================
--===============================================
--==           Register Callback               ==
--===============================================
RegisterNUICallback('register', function(data, cb)
  myIdentity = data
  TriggerServerEvent('esx_identity:setIdentity', data)
  DoScreenFadeOut(10)
  EnableGui(false)
  Wait (500)
  SetTimecycleModifier('default')
  local skinfemale = {["tshirt_2"]=0,["eyebrows_2"]=10,["eye_color"]=2,["watches_1"]=6,["ears_2"]=-1,["lipstick_4"]=35,["moles_1"]=0,["mom"]=21,["chain_1"]=0,["mask_1"]=0,["hair_1"]=4,["bags_1"]=0,["lipstick_3"]=35,["age_2"]=0,["ears_1"]=-1,["hair_color_1"]=35,["bracelets_1"]=-1,["torso_1"]=207,["makeup_2"]=4,["glasses_2"]=-1,["glasses_1"]=-1,["watches_2"]=1,["bags_2"]=0,["face"]=10,["arms_2"]=0,["arms"]=11,["dad"]=0,["beard_2"]=0,["skin"]=12,["sex"]=1,["age_1"]=0,["blush_1"]=0,["shoes_2"]=1,["beard_1"]=0,["moles_2"]=1,["complexion_1"]=0,["makeup_4"]=35,["hair_color_2"]=35,["makeup_1"]=6,["torso_2"]=0,["helmet_2"]=-1,["tshirt_1"]=2,["lipstick_1"]=0,["mask_2"]=0,["eyebrows_1"]=0,["shoes_1"]=1,["chain_2"]=0,["blush_2"]=0,["bracelets_2"]=-1,["pants_2"]=1,["helmet_1"]=-1,["makeup_3"]=20,["pants_1"]=0,["hair_2"]=0,["complexion_2"]=1,["lipstick_2"]=10}
  local skinmale = {["age_1"]=0,["makeup_2"]=0,["eyebrows_1"]=0,["helmet_1"]=-1,["lipstick_3"]=0,["tshirt_2"]=0,["sex"]=0,["helmet_2"]=-1,["bracelets_1"]=-1,["glasses_2"]=-1,["eye_color"]=2,["arms"]=4,["makeup_3"]=0,["tshirt_1"]=15,["lipstick_2"]=0,["chain_2"]=0,["hair_color_1"]=4,["beard_1"]=0,["moles_2"]=1,["face"]=0,["moles_1"]=0,["watches_1"]=-1,["beard_3"]=0,["glasses_1"]=-1,["dad"]=0,["shoes_1"]=1,["arms_2"]=0,["hair_2"]=0,["watches_2"]=-1,["mom"]=21,["pants_1"]=25,["complexion_1"]=0,["ears_2"]=-1,["hair_1"]=2,["pants_2"]=0,["beard_2"]=5,["age_2"]=0,["lipstick_4"]=0,["torso_1"]=171,["bags_2"]=0,["blush_3"]=32,["beard_4"]=0,["lipstick_1"]=0,["blush_1"]=0,["mask_2"]=0,["shoes_2"]=0,["chain_1"]=0,["makeup_4"]=0,["skin"]=12,["mask_1"]=0,["eyebrows_2"]=10,["blush_2"]=0,["ears_1"]=-1,["torso_2"]=0,["makeup_1"]=0,["hair_color_2"]=4,["bags_1"]=0,["bracelets_2"]=-1,["complexion_2"]=1}
  if data.sex == 'f' then
	TriggerEvent('skinchanger:loadSkin', skinfemale)
  elseif data.sex == 'm' then
	TriggerEvent('skinchanger:loadSkin', skinmale)
  end
  Citizen.Wait(500)
  TriggerEvent('ds_selection:phase1')
end)


--===============================================
--==                 THREADING                 ==
--===============================================
Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
            DisableControlAction(0, 18, guiEnabled) -- Enter
            DisableControlAction(0, 322, guiEnabled) -- ESC
            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)
