%dw 2.0
import frequencies from AnalyticsModule
output application/json
---
frequencies([1,2,3,4,1,2])
