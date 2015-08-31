-- Copyright 2015 Mirantis, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
local cjson = require 'cjson'

local M = {}
setfenv(1, M) -- Remove external access to contain everything in the module

function create_cluster_alarm(cluster_name, alarm_type, alarm_name, alarm_value, alarm_interval, source, level_1_alarms, level_2_alarms)
    local payload = {
        first={
            alarms=level_1_alarms
        },
        second={
            alarms=level_2_alarms
        }
    }

    return {
        Type = alarm_type,
        Payload = cjson.encode(payload),
        Fields = {
            name=alarm_name,
            value=alarm_value,
            cluster_name=cluster_name,
            interval=alarm_interval,
            source=source
        }
    }
end

return M
