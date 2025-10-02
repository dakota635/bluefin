#!/usr/bin/env bash


handle_setup_stage() {
    if [ "$BAZAAR_TS_TYPE" = install ]; then
        case "$BAZAAR_TS_APPID" in
            com\.jetbrains\.*)
                echo 'ok'
                ;;
            *)
                echo 'pass'
                ;;
        esac
    else
        echo 'pass'
    fi
}


handle_setup_dialog_stage() {
    echo 'ok'
}


handle_teardown_dialog_stage() {
    case "$BAZAAR_HOOK_DIALOG_RESPONSE_ID" in
        goto-web)
            echo 'ok'
            ;;
        *)
            echo 'abort'
            ;;
    esac
}


handle_catch_stage() {
    echo 'abort'
}


handle_action_stage() {
    nohup ujust install-jetbrains-toolbox
}


handle_teardown_stage() {
    echo 'deny'
}


# Branch based on the stage
case "$BAZAAR_HOOK_STAGE" in
    setup) handle_setup_stage ;;
    setup-dialog) handle_setup_dialog_stage ;;
    teardown-dialog) handle_teardown_dialog_stage ;;
    catch) handle_catch_stage ;;
    action) handle_action_stage ;;
    teardown) handle_teardown_stage ;;
esac

exit 0