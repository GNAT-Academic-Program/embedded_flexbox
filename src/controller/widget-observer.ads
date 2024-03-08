with Ada.Strings.Unbounded;

package Widget.Observer is
    type widget_index is range 1 .. 100;
    type widget_array is array (widget_index) of Widget.Any_Acc;
    event_widgets : widget_array;
    
    subtype Parent is Widget.Instance;

    type Instance is new Parent with 
    record
        --event_widgets : widget_array;
        temp_value : Natural;
    end record;

    subtype Class is Instance'Class;

    type Acc is access all Instance;
    type Any_Acc is access all Class;

    function Create (id            : string;
                     parent        : Widget.Any_Acc;
                     temp_value    : Natural := 0;
                     self_flex     : flex_t  := default_flex;
                     child_flex    : flex_t  := default_flex;
                     min_height, min_width : Natural := 0;
                     max_height, max_width : Natural := Natural'Last;
                     bgd           : Bitmap_Color) return Widget.Any_Acc;

   procedure add_Widget(w: in out Widget.Any_Acc);
   procedure remove_Widget(w: in out Widget.Any_Acc);
   procedure handle_event(x_Input : Natural; y_Input : Natural);

private

    subtype Dispatch is Instance'Class;

end Widget.Observer;