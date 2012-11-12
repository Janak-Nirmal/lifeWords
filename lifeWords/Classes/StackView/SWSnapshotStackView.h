//  SWSnapshotStackView.h
//
//  Created by JustaLiar on 12/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>


// ********************************************************************** //
// TYPE DEFINITIONS
// ********************************************************************** //

//! Snapshot Position data structure
/*!
  Defines the centre position and angle of rotation about the centre of
  a snapshot.  Multiple snapshots at slightly varying positions then form
  a stack.
  
  Structure stores pre-calculated positions (which in future may be
  randomised upon initialisation of the view if configured to do so),
  which also allows the pre-calculation of the bounding rectangles of
  the snapshots in their specified positions (rotated and off-centre).
*/
typedef struct
{
  //! Centre point of rectangle (currently unused)
  //! Had thoughts of randomising and offsetting the centre points of
  //! underlying snapshots in the stack within a small radius of the views
  //! centre for make their placement look a little more adhoc and hence
  //! more natural. May update to make this functionality optional in the
  //! future.
  //CGPoint centre;
  
  //! Angle of rotation about the centre point, positive angle clockwise,
  //! negative angle counter-clockwise, specified in degrees.
  CGFloat angleRotation;
  
  //! Calculated size of bounding rectangle after rotation, as width and
  //! height protude outside the non-rotated base rectangle.  The bounding
  //! rectangle size is used to determine the required scaling to fit the
  //! snapshot within the views frame.
  CGSize boundingRectSize;
}
SnapshotPosition_t;


// ********************************************************************** //
// SNAPSHOT STACK VIEW CLASS
// ********************************************************************** //

#pragma mark Snapshot Stack View class

//! Snapshot Stack Image View
@interface SWSnapshotStackView : UIView 
{
  // ******************************************************************** //	
  // CONSTANTS

#pragma mark Constants

//! Number of snapshots to display within the stack of shots
#define SWSnapshotStackViewSnapshotsPerStack 3  


  // ******************************************************************** //	
  // MEMBER VARIABLES
  
  BOOL m_displayStack;    // property (displayAsStack)
  UIImage *m_image;       // property (image)
  
  //! Aspect Ratio of current image (Width/Height)
  CGFloat m_imageAspect;

  //! Array of defining the position of each snapshot in the stack, 
  //! defined from bottom of stack to the top, where the top image in
  //! the stack always has zero rotation.
  SnapshotPosition_t m_snapshotPositions[SWSnapshotStackViewSnapshotsPerStack];
  //! Index to snapshot within the positions array, requiring most scaling //! (minimum scaling factor) to fit within views frame.
  NSInteger m_minScaleShotIdx;
  //! Minimum scaling factor was calculated using image width (YES) otherwise
  //! height (NO), stored to avoid recalculation and comparison when drawing.
  BOOL m_scaledUsingWidth;
  
  //! Shadow Direction Sign
  //! Support for inversion of shadow base translation, y-axis in iOS 3.2+
  //! Stored to avoid having to recheck system OS version during redrawing etc.
  //! In <3.2, positive y, translates shadow DOWN
  //! In 3.2+, positive y, translates shadow UP
  //! NOTE: Not required if you do not wish to support iOS <3.2
  CGFloat m_shadowDirSign;
}


// ********************************************************************** //
// PROPERTIES

#pragma mark Properties

//! Display as a stack of multiple snapshots
/*!
    Display a stack of snapshots (YES) with the image provided within the
    image property as the top most snapshot, othwerwise display image as
    a single snapshot (NO).
 */
@property (nonatomic, assign) BOOL displayAsStack;

//! Image to display within the snapshot stack view
@property (nonatomic, retain) UIImage *image;


// ********************************************************************** //

@end  // @SWSnapshotStackView

// ********************************************************************** //

// End of File
