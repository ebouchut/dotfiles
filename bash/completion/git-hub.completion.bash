#!bash

# DO NOT EDIT. This file generated by tool/generate-completion.pl.

_git_hub() {
    local _opts=" -h --help --remote= --branch= --org= -c= --count= -a --all -q --quiet -v --verbose -r --raw -j --json -A --use-auth -C --no-cache --token= -d --dryrun -T -O -H -J -R -x"
    local subcommands="cache-clear clone collabs comment config config-keys config-list config-unset follow followers following follows fork forks gist gist-clone gist-delete gist-edit gist-fork gist-get gist-init gist-new gist-star gist-unstar gists git-hub-travis help info irc-enable irc-enable irc-url issue issue-close issue-edit issue-new issue-resolve issues keys keys-add member-add member-get member-remove members notify-list open org org-edit org-get org-members org-repos orgs pr-created pr-diff pr-fetch pr-involves pr-list pr-merge pr-new pr-queue repo repo-delete repo-edit repo-get repo-init repo-new repos scope-add scope-remove scopes search-issues search-repo search-user setup star starred stars team team-delete team-members team-new team-repo-add team-repos teams token-delete token-get token-new tokens trust unfollow unstar untrust unwatch upgrade url user user-edit user-get version watch watchers watching"
    local subcommand="$(__git_find_on_cmdline "$subcommands")"

    if [ -z "$subcommand" ]; then
        # no subcommand yet
        case "$cur" in
        -*)
            __gitcomp "$_opts"
        ;;
        *)
            __gitcomp "$subcommands"
        esac

    else

        # dynamic completions
        local last=${COMP_WORDS[ $COMP_CWORD-1 ]}

        if [[ $last == "--remote" || $cur =~ ^--remote= ]]; then
            local dynamic_comp=`git remote`
            __gitcomp "$dynamic_comp" "" "${cur##--remote=}"
            return
        fi

        case "$cur" in

        -*)
            __gitcomp "$_opts"
            return
        ;;

        *)
            if [[ $subcommand == help ]]; then
                __gitcomp "$subcommands"
            elif [[ $subcommand == "config" || $subcommand == "config-unset" ]]; then
                local config_keys
                config_keys=`git hub config-keys`
                __gitcomp "$config_keys"
            fi
        ;;

        esac

    fi
}
