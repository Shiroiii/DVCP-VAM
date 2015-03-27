%	Copyright � 2015 Alexander Isakov. Contact: <alexander.isakov@tuhh.de>
%	Copyright � 2015 Marina Krotofil. Contact: <marina.krotofil@tuhh.de>
%	Copyright � 2015 TUHH-SVA Security in Distributed Applications.
%	All rights reserved.
%	License: http://opensource.org/licenses/BSD-3-Clause
%	----------------------------------------------------------------------
function settings(window, data, callback)

    set(window, 'Name', 'Settings');
    set(window, 'NumberTitle', 'off');
    set(window, 'MenuBar', 'none');
    set(window, 'Toolbar', 'none');
    set(window, 'Position', [0,0,320,400]);
    center(window);
    interface.window = window;
    
    constraints_text{1} = 'O2 concentration in reactor feed (< 8 mol%)';
    constraints_text{2} = 'Pressure in the gas loop (< 140 psia)';
    constraints_text{3} = 'Peak reactor temperature (< 200 C)';
    constraints_text{4} = 'Liquid levels in the vessels (10-90%)';
    constraints_text{5} = 'Reactor feed temperature (> 130C)';
    constraints_text{6} = 'FEHE hot effluent temperature (> 130C)';
    constraints_text{7} = 'HAc concentration in decanter (< 0.06 mol%)';
    constraints_text{8} = 'VAC concentration in column bottom (< 0.01 mol%)';
    
    disturbances_text{1} = 'Step change in C2H4 concentration in fresh C2H4 feed';
    disturbances_text{2} = 'Loss of column feed (5 min)';
    disturbances_text{3} = 'Loss of fresh HAc feed stream (5 min)';
    disturbances_text{4} = 'Loss of fresh O2 stream';
    disturbances_text{5} = 'Organic product composition analyzer off-line';
    disturbances_text{6} = 'Colomn bottom composition analyzer off-line';
    disturbances_text{7} = 'Gas recycle composition analyzer off-line';

    grid = uiextras.Grid('Parent', window, ...
        'Spacing', 6, ...
        'Padding', 4);
    tabs = uiextras.TabPanel('Parent', grid);
    % simulation
    panel = uipanel('Parent', tabs);
    vbox = uiextras.VBox('Parent', panel, ...
        'Spacing', 4, ...
        'Padding', 10);
    uicontrol('Parent', vbox, ...
              'Style', 'text', ...
              'FontSize', 11, ...
              'HorizontalAlignment', 'left', ...
              'String', 'Duration');
    hbox = uiextras.HBox('Parent', vbox, ...
                'Spacing', 4);
    interface.simulation.duration = uicontrol('Parent', hbox, ...
            'Style', 'edit', ...
            'HorizontalAlignment', 'left', ...
            'FontSize', 11, ...
            'String',  data.simulation.duration);
    interface.simulation.durationunits = uicontrol('Parent', hbox, ...
                'Style', 'popup', ...
                'FontSize', 8, ...
                'String', TimeUnits.Units(), ...
                'Value', 1);
	set(hbox, 'Sizes', [-1 80]);
    set(vbox, 'Sizes', [18 20]);
    % disturbances
    panel = uipanel('Parent', tabs);
    vbox = uiextras.VBox('Parent', panel, ...
        'Spacing', 4, ...
        'Padding', 10);
    % first
    disturbances(1) = uicontrol('Parent', vbox, ...
              'Style', 'checkbox', ...
              'String', disturbances_text(1), ...
              'Value', data.simulation.disturbances(1));
    disturbances(2) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', disturbances_text(2), ...
      'Value', data.simulation.disturbances(2));
    disturbances(3) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', disturbances_text(3), ...
      'Value', data.simulation.disturbances(3));
    disturbances(4) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', disturbances_text(4), ...
      'Value', data.simulation.disturbances(4));
    disturbances(5) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', disturbances_text(5), ...
      'Value', data.simulation.disturbances(5));
    disturbances(6) = uicontrol('Parent', vbox, ...
        'Style', 'checkbox', ...
        'String', disturbances_text(6), ...
        'Value', data.simulation.disturbances(6));
    disturbances(7) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', disturbances_text(7), ...
      'Value', data.simulation.disturbances(7));
    interface.simulation.disturbances = disturbances;
    set(vbox, 'Sizes', ones(1, 7)*20);
    % constraints
    panel = uipanel('Parent', tabs);
    vbox = uiextras.VBox('Parent', panel, ...
        'Spacing', 4, ...
        'Padding', 10);
    constraints(1) = uicontrol('Parent', vbox, ...
              'Style', 'checkbox', ...
              'String', constraints_text(1), ...
              'Value', data.simulation.constraints(1));
    constraints(2) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(2), ...
      'Value', data.simulation.constraints(2));
    constraints(3) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(3), ...
      'Value', data.simulation.constraints(3));
    constraints(4) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(4), ...
      'Value', data.simulation.constraints(4));
    constraints(5) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(5), ...
      'Value', data.simulation.constraints(5));
    constraints(6) = uicontrol('Parent', vbox, ...
        'Style', 'checkbox', ...
        'String', constraints_text(6), ...
        'Value', data.simulation.constraints(6));
    constraints(7) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(7), ...
      'Value', data.simulation.constraints(7));
    constraints(8) = uicontrol('Parent', vbox, ...
      'Style', 'checkbox', ...
      'String', constraints_text(8), ...
      'Value', data.simulation.constraints(8));
    interface.simulation.constraints = constraints;
    set(vbox, 'Sizes', ones(1, 8)*20);
    % callbacks
    panel = uipanel('Parent', tabs);
    vbox = uiextras.VBox('Parent', panel, ...
        'Spacing', 4, ...
        'Padding', 10);
    uicontrol('Parent', vbox, ...
              'Style', 'text', ...
              'FontSize', 9, ...
              'HorizontalAlignment', 'left', ...
              'String', 'After end:');
    interface.simulation.callbacks.afterend = uicontrol('Parent', vbox, ...
            'Style', 'edit', ...
            'HorizontalAlignment', 'left', ...
            'FontSize', 11, ...
            'Max', 5, ...
            'Min', 0, ...
            'String',  data.simulation.callbacks.afterend);
    set(vbox, 'Sizes', [18 -1]);
    tabs.TabNames = {'General', 'Disturb-s', 'Constraints', 'Callbacks'};
    tabs.SelectedChild = 1;
    %buttons
    buttons = uiextras.HButtonBox('Parent', grid, ...
            'HorizontalAlignment', 'right', ...
            'Padding', 10);
    interface.buttons.apply = uicontrol('Parent', buttons, ...
        'String', 'Apply', ...
        'Callback', @onApply);
    function onApply(~,~)
        %simulation/duration
        value = str2double(get(interface.simulation.duration, 'String'));
        if isempty(value)
            warning('VAC:settings:onApply', 'Value must be a number.');
            set(interface.simulation.duration, 'String', 24);
            return;
        end
        if value <= 0
            warning('VAC:settings:onApply', 'Value must be a positiv double.');
            set(interface.simulation.duration, 'String', 24);
            return;
        end
        switch get(interface.simulation.durationunits, 'Value')
            case TimeUnits.MINUTES.Value
                options.simulation.duration = value/60;
            case TimeUnits.SECONDS.Value
                options.simulation.duration = value/3600;
            otherwise
                options.simulation.duration = value;
        end
        %disturbances
        for i = 1:length(interface.simulation.disturbances)
           options.simulation.disturbances(i) = get(interface.simulation.disturbances(i), 'Value');
        end
        %constraints
        for i = 1:length(interface.simulation.constraints)
           options.simulation.constraints(i) = get(interface.simulation.constraints(i), 'Value');
        end
        %callbacks
        options.simulation.callbacks.afterend = get(interface.simulation.callbacks.afterend, 'String');
        %call back
        callback(options);
        close(interface.window);
    end % onApply
    interface.buttons.apply = uicontrol('Parent', buttons, ...
        'String', 'Cancel', ...
        'Callback', @onCancel);
    function onCancel(~,~)
        close(interface.window);
    end % onApply
    set(grid, 'RowSizes', [-1 45]);
end

