require "slack-notify"
require 'clockwork'
# 下記のgemをrequireすると、minutesなどの時間を指し示すメソッドを使えるようになるので、記述しておくことを推奨します。
require 'active_support/time'

module Clockwork
  # ここに、「どれくらいの周期で処理をするのか？」というClockworkのメソッドを記述します
  # ここに、slackで一定時間ごとに送りたい処理と設定を書き込みます
  handler do |job|
    case job
    when 'less.frequent.job'
      # 10 秒毎の処理
      sample = SlackNotify::Client.new(
        webhook_url: 'https://hooks.slack.com/services/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',
        # webhook_url: ENV['WEBHOOK_URI'],
        channel: "#bot",
      )
      sample.notify("Hi!")
    end
  end
  every(3.minutes, 'less.frequent.job')
end