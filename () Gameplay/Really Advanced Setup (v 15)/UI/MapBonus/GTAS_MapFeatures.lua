
-- GTAS_MapFeatures - Part of Really Advanced Setup Mod

include("IconSupport");
include("InstanceManager");

include("GTAS_Constants");
include("GTAS_Utilities");
include("GTAS_FeatureTypes");
include("GTAS_PlotPlacement");
include("GTAS_ScrollText");

local NO_FEATURE = -1;
local MAX_COUNT = 100;

local FeatureID = NO_FEATURE;
local IgnoreTerrain = false;
local PlotCount = 1;
local ReplaceFeature = false;

local FeatureManager = InstanceManager:new("FeatureInstance", "FeatureRoot", Controls.FeatureStack)
local FeatureHelpManager = InstanceManager:new("FeatureHelpInstance", "FeatureHelpRoot", Controls.FeatureStack);

--------------------------------------------------------------------------------------------------
function BuildFeatures()
	local features = {};

	for feature in GetFeatureList() do
		table.insert(features, { id = feature.ID, description = Locale.ConvertTextKey(feature.Description) });
	end

	table.sort(features, function(a, b) return Locale.Compare(a.description, b.description) == -1; end);

	if FeatureID == NO_FEATURE then
		FeatureID = features[1].id;
	end

	local featureInfo = GameInfo.Features[FeatureID];

	-- Feature Portrait -------------------------------------------------------------------
	if featureInfo ~= nil and IconHookup(featureInfo.PortraitIndex, 256, featureInfo.IconAtlas, Controls.Portrait) then
		Controls.PortraitFrame:SetHide(false);
	else
		Controls.PortraitFrame:SetHide(true);
	end

	-- Feature PullDown -------------------------------------------------------------------
	Controls.FeaturePulldown:ClearEntries();

	for feature in GetList(features) do
		local control = {};
		Controls.FeaturePulldown:BuildEntry("InstanceOne", control);
		control.Button:SetVoid1(feature.id);
		control.Button:LocalizeAndSetText(feature.description);
	end

	function OnFeature(id)
		FeatureID = id;
		PerformBuild();
	end
	Controls.FeaturePulldown:RegisterSelectionCallback(OnFeature);
	
	if featureInfo ~= nil then
		Controls.FeaturePulldown:GetButton():LocalizeAndSetText(featureInfo.Description);
	else
		Controls.FeaturePulldown:GetButton():SetText("Feature Error");
	end
	
	Controls.FeaturePulldown:CalculateInternals();

	-- Feature PlotCount Slider ----------------------------------------------------------------
	function OnPlotCount(fValue)
		PlotCount = GetSliderValue(fValue, 1, MAX_COUNT);
		Controls.CountValue:SetText(tostring(PlotCount));
	end
	Controls.CountSlider:RegisterSliderCallback(OnPlotCount);
	SetSliderValue(Controls.CountSlider, PlotCount, 1, MAX_COUNT);
	Controls.CountValue:SetText(tostring(PlotCount));

	-- ChangeWaterLand CheckBox --------------------------------------------------------------
	function OnReplaceFeature(isChecked)
		ReplaceFeature = isChecked;
	end
	Controls.ReplaceFeature:RegisterCheckHandler(OnReplaceFeature)
	Controls.ReplaceFeature:SetCheck(ReplaceFeature);

	-- Add Feature Button -----------------------------------------------------------------------------
	function OnAddFeature()
		if featureInfo ~= nil then
			MapData:AddFeature(featureInfo.Type, PlotCount, 0, 0, MAP_PLACEMENT, ReplaceFeature);
		end
		PerformBuild();
	end
	Controls.AddFeature:RegisterCallback(Mouse.eLClick, OnAddFeature);

	-- Clear List Button -----------------------------------------------------------------------------
	function OnClearList()
		MapData:ResetFeatures();
		PerformBuild();
	end
	Controls.ClearList:RegisterCallback(Mouse.eLClick, OnClearList);

	-- Feature ScrollPanel -------------------------------------------------------------------
	FeatureManager:ResetInstances();
	FeatureHelpManager:ResetInstances();

	if MapData:HasFeatures() then
		Controls.ListTitle:SetHide(false);

		for index, feature in MapData:FeatureList() do
			local instance = FeatureManager:GetInstance();
			local info = GameInfo.Features[feature.featureType];

			if info ~= nil then
				IconHookup(info.PortraitIndex, 64, info.IconAtlas, instance.FeaturePortrait);
				instance.FeatureName:LocalizeAndSetText(info.Description);
			else
				IconHookup(22, 64, "LEADER_ATLAS", instance.FeaturePortrait);
				instance.FeatureName:LocalizeAndSetText("Random");
			end

			instance.FeatureCount:SetText(tostring(feature.count));
			instance.FeatureMinRad:SetText("*");
			instance.FeatureMaxRad:SetText("*");
			instance.FeaturePlacement:SetText(GetPlacementText(feature.placementType));
			instance.FeatureReplace:SetText(feature.replaceFeature and "Yes" or "No");

			function OnFeatureButton()
				if info ~= nil then
					FeatureID = info.ID;
				end

				PlotCount = feature.count;
				ReplaceFeature = feature.replaceFeature;
				PerformBuild();
			end
			instance.FeatureButton:RegisterCallback(Mouse.eLClick, OnFeatureButton);

			function OnUpdate()
				if featureInfo ~= nil then
					MapData:UpdateFeature(index, featureInfo.Type, PlotCount, 0, 0, MAP_PLACEMENT, ReplaceFeature);
				end
				PerformBuild();
			end
			instance.UpdateFeature:RegisterCallback(Mouse.eLClick, OnUpdate);

			function OnDelete()
				MapData:RemoveFeature(index);
				PerformBuild();
			end
			instance.DeleteFeature:RegisterCallback(Mouse.eLClick, OnDelete);
		end

	else
		Controls.ListTitle:SetHide(true);
		CreateScrollText(FeatureMapText, FeatureHelpManager);
	end

	Controls.FeatureStack:CalculateSize();
	Controls.FeatureStack:ReprocessAnchoring();
	Controls.FeatureScrollPanel:ReprocessAnchoring();
	Controls.FeatureScrollPanel:CalculateInternalSize();
end

------------------------------------------------------------------
function ValidateControls()
	LuaEvents.GTAS_ValidateControls();
end

----------------------------------------------------------------
function PerformBuild()
	BuildFeatures();
	ValidateControls(); -- This should always get called last.
	LuaEvents.GTAS_UpdateMapBonusTopPanel();
end

----------------------------------------------------------------
function ShowHideHandler(isHide, isInit)
	local buffer = {};
	LuaEvents.GetDataObjects(buffer);
	SlotData = buffer[DATA_SLOT];
	MapData = buffer[DATA_MAP];
	GameData = buffer[DATA_GAME];
	GlobalData = buffer[DATA_GLOBAL];

	if not isHide and not isInit then
		PerformBuild();
	end

end
ContextPtr:SetShowHideHandler(ShowHideHandler);

-----------------------------------------------------------------
function AdjustScreenSize()
    local _, screenY = UIManager:GetScreenSizeVal();
	Controls.FeaturePanel:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET);
	Controls.FeatureBorder1:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 4);
	Controls.FeatureBorder2:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 6);
	Controls.ScrollBox:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 275);
	Controls.ScrollBorder1:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 313);
	Controls.ScrollBorder2:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 315);
	Controls.FeatureScrollPanel:SetSizeY(screenY - PLAYER_PANEL_HEIGHT_OFFSET - 317);
	Controls.FeatureScrollPanel:CalculateInternalSize();
end

-------------------------------------------------
function OnUpdateUI( type )
    if( type == SystemUpdateUIType.ScreenResize ) then
        AdjustScreenSize();
    end
end
Events.SystemUpdateUI.Add( OnUpdateUI );

AdjustScreenSize();



