local start_delay

local repetition_count

local cue_delay
local active_duration
local pause_duration

-- this function is called when the box is initialized
function initialize(box)
	-- load the stimulation codes
	dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")

	math.randomseed(os.time()) -- to be sure we have a different pseudo-random generator

	start_delay = box:get_setting(2)
	repetition_count = box:get_setting(3)
	active_duration = box:get_setting(4)
	pause_duration = box:get_setting(5)

	box:log("Info", "the stimulator will do [" .. repetition_count .. "] repetitions every ["
  .. (active_duration + pause_duration).."] seconds,  starting after ["
  .. start_delay .. "] seconds.")

end

-- this function is called when the box is uninitialized
function uninitialize(box)
	box:log("Info", "Uninitializing the box")
end

-- this function is called once by the box
function process(box)

	local stimulation_date = start_delay
	box:send_stimulation(1, OVTK_StimulationId_ExperimentStart, stimulation_date, 0)
  stimulation_date = stimulation_date + pause_duration

	for trial = 1, repetition_count do

		local target_index = math.random(2) -- cannot be the first

    if target_index == 1 then
      cue_stimulation = OVTK_StimulationId_Target
    else
      cue_stimulation = OVTK_StimulationId_NonTarget
    end

    box:send_stimulation(1, cue_stimulation, stimulation_date, 0)

    stimulation_date = stimulation_date + active_duration
    box:send_stimulation(1, OVTK_StimulationId_VisualStimulationStop, stimulation_date, 0)

    stimulation_date = stimulation_date + pause_duration

	end

	box:send_stimulation(1, OVTK_StimulationId_ExperimentStop, stimulation_date, 0)
end

