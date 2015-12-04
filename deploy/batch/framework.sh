#!/bin/sh -ex

cd ..
[ -d hosts_batch ]
[ -d tasks ]
[ -d tasks_batch ]

deploy_batch(){
	rm -vf hosts_batch/*.ok tasks_batch/*
	tasks=
	for task in $@; do
		[ -e tasks/$task ]
		ln -sv ../tasks/$task tasks_batch/
		tasks="$tasks $task"
	done
	if [ -n "$DEPLOY_BATCH_REORDER" ]; then
		src_task=
		dst_task=
		for task in $DEPLOY_BATCH_REORDER; do
			if [ -n "$src_task" ]; then
				dst_task=$task
			else
				src_task=$task
			fi
			if [ -n "$src_task" -a -n "$dst_task" ]; then
				[ -e tasks/$src_task ]
				[ ! -e tasks_batch/$dst_task ]
				ln -sv ../tasks/$src_task tasks_batch/$dst_task
				tasks="$tasks $src_task"
				src_task=
				dst_task=
			fi
		done
		[ -z "$src_task" ]
	fi
	./deploy.sh tasks_batch hosts_batch
	for f in hosts_batch/*.fail; do [ ! -e $f ]; done
	echo "OK: $tasks"
}
