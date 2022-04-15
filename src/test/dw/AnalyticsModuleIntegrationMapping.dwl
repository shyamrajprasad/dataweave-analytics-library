/**
* This mapping won't be shared through your library, but you can use it to try out your module and create integration tests.
*/
%dw 2.0
import * from AnalyticsModule

output application/json
---
{
    mean : mean(payload),
    frequencies : frequencies(payload)
}