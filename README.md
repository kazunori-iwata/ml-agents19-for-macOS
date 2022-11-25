# macOS で Unity ML-Agents を動作させるための Docker の設定

Mac のローカルに ml-agents と言う名前のディレクトリを作成し，そこにファイルを置く設定になっている（バインドマウント）．  
その際に，Mac 上の UID などを取得しているので，Mac 上のエディタでプログラムなどを編集することができる．  

なお，Docker の名前付き Volume を使いたい場合は別途設定をする必要がある．  

## 実行方法
1. ml-agent を置きたいディレクトリにすべてのファイルをダウンロードする
  * Dockerfile
  * docker-build.sh
  * docker-run.sh
  * docker-attach.sh
  * setup.sh

2. sh docker-build.sh を実行する  ml-agents が作られる
3. 
