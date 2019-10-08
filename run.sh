# Sentence A and Sentence B are separated by the ||| delimiter for sentence
# pair tasks like question answering and entailment.
# For single sentence inputs, put one sentence per line and DON'T use the
# delimiter.
# echo 'Who was Jim Henson ? ||| Jim Henson was a puppeteer' > ./data/input.txt
echo '我爱你中国' > ./data/input.txt

BERT_BASE_DIR=./model

# https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip

python extract_features.py \
  --input_file=./data/input.txt \
  --output_file=./data/output.jsonl \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --layers=-1,-2,-3,-4 \
  --max_seq_length=128 \
  --batch_size=8

python format.py ./data/output.json1 ./data/out.txt
