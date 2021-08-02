# create mapping template
curl -XPUT "http://alpha:9200/_template/ip-ua-matching" -H 'Content-Type: application/json' -d'
{
  "index_patterns": "ip-ua-matching-*",
  "settings": {
    "number_of_replicas": 1,
    "number_of_shards": 5
  },
  "mappings": {
    "_doc": {
      "_source": {
        "enabled": true
      },
      "properties": {
        "device_id":{
          "type": "keyword"
        },
        "ip_address": {
          "type": "ip"
        },
        "ua": {
          "type": "text"
        }
      }
    }
  }
}'


# list all pipelines
GET _ingest/pipeline

GET hy-events-daily-pbs-2019-11-27-bid/_search
{
	"query":{
		"bool":{
		  "must":[{
				"match":{
					"deal_id":"6471630"
				}
			},{
				"match":{
					"dmp_target":"1"
				}
			}
			],
			"must_not":[{
				"match":{
					"ad_id":"24168"
				}
			},{
				"match":{
					"ad_id":"24167"
				}
			}
			],
			"filter":{
				"range":{
	"occured_at":{"gte":"2019-11-27T17:00:00+08:00","lt": "2019-11-27T18:00:00+08:00"}
				}
			}
		}
	}
	, "size": 500
}



# 指定index的类型和副本等
PUT _template/hy-datasay-tmpl
{
  "index_patterns": "hy-datasay*",
  "settings": {
    "number_of_replicas": 2,
    "number_of_shards": 5
  },
  "mappings": {
    "_doc": {
      "_source": {
        "enabled": true
      },
      "properties": {
        "occured_at": {"type": "date"},
        "start_time": {"type": "date"},
        "end_time": {"type": "date"},
        "mac":{"type":"keyword"},
        "probe_id":{"type":"keyword"},
        "floor":{"type":"keyword"},
        "space_id":{"type":"keyword"},
        "space_type":{"type":"keyword"},
        "connecting_ssid":{"type":"keyword"},
        "building_id":{"type":"keyword"},
        "building_type":{"type":"keyword"},
        "floor_type":{"type":"keyword"},
        "rssi":{"type":"integer"},
        "stay_seconds":{"type":"integer"}
      }
    }
  }
}




# doc indexes

# search docs
GET ip-ua-matching-wexin/_doc/_search

# complex search
GET ip-ua-matching-pbs/_search
{
  "query": {
    "bool": {
      "must": [
        { "match": { "ip_address":   "180.109.26.150"} },
        { "match": { "user_agent.name.keyword": "Chrome Mobile WebView" } }
      ]
    }
  }
}

# indexing docs with pipeline defined
PUT ip-ua-matching-wexin/_doc/d5387258af8f84406a1ff044877dd476?pipeline=hy-event-pipeline
{
    "device_id" : "d5387258af8f84406a1ff044877dd476",
    "ip_address" : "112.64.68.13",
    "ua" : "HUAWEI-VTR-AL00__weibo__9.6.0__android__android7.0"
}


# 修改index名
POST _reindex
{
    "source": {
    "index": "hy-datasay-probe1motion-2020-07-01"
    },
    "dest": {
    "index": "hy-datasay-probe1-motion-2020-07-01",
    "op_type": "create"
    }
}
